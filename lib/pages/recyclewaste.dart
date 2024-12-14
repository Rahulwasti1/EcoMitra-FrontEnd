import 'package:flutter/material.dart';
import 'package:camera/camera.dart'; // For accessing the camera
import 'package:tflite/tflite.dart'; // For using the TensorFlow Lite model
import 'package:url_launcher/url_launcher.dart'; // To open YouTube links

class RecPage extends StatefulWidget {
  const RecPage({super.key});

  @override
  _RecPageState createState() => _RecPageState();
}

class _RecPageState extends State<RecPage> {
  CameraController? cameraController; // To control the camera
  bool isDetecting = false; // To check if detection is in progress
  List<dynamic>? recognitions; // To store the model recognition results

  @override
  void initState() {
    super.initState();
    loadModel(); // Load the tflite model when the app starts
    initializeCamera(); // Initialize the camera
  }

  // Load the TensorFlow Lite model
  Future<void> loadModel() async {
    String? result = await Tflite.loadModel(
      model: "assets/model.tflite", // Ensure the model is in the assets folder
      labels: "assets/labels.txt", // Label file for the model
    );
    print("Model loaded: $result");
  }

  // Initialize the camera
  Future<void> initializeCamera() async {
    final cameras = await availableCameras(); // Get available cameras
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);

    // Initialize camera
    await cameraController?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      cameraController?.startImageStream((image) {
        if (!isDetecting) {
          isDetecting = true;

          // Run model on the image
          Tflite.runModelOnFrame(
            bytesList: image.planes.map((plane) {
              return plane.bytes;
            }).toList(),
            imageHeight: image.height,
            imageWidth: image.width,
            imageMean: 127.5,
            imageStd: 127.5,
            rotation: 90,
            numResults: 2,
            threshold: 0.5,
            asynch: true,
          ).then((recognitions) {
            setState(() {
              this.recognitions = recognitions;
            });
            isDetecting = false;

            // Check if a bottle is detected
            if (recognitions!.isNotEmpty) {
              for (var recognition in recognitions) {
                if (recognition["label"] == "bottle") {
                  // Redirect to a DIY YouTube video when a bottle is detected
                  launchYouTubeDIY();
                  break;
                }
              }
            }
          }).catchError((error) {
            print("Error detecting object: $error");
            isDetecting = false;
          });
        }
      });
    });
  }

  // Launch a YouTube DIY video related to bottles
  void launchYouTubeDIY() async {
    const url = 'https://www.youtube.com/results?search_query=DIY+bottle+recycling';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void dispose() {
    cameraController?.dispose(); // Dispose of the camera when done
    Tflite.close(); // Close the TensorFlow Lite model
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.green,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: BackButton(onPressed: () {
            Navigator.of(context).pop();
          }),
        ),
        title: const Text(
          'AI Recycle',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: cameraController != null && cameraController!.value.isInitialized
          ? Stack(
        children: [
          CameraPreview(cameraController!), // Display camera preview
          if (recognitions != null)
            Positioned(
              bottom: 10,
              left: 10,
              child: Text(
                "Recognitions: ${recognitions?.map((res) => res['label']).join(', ')}",
                style: TextStyle(
                  backgroundColor: Colors.white,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
        ],
      )
          : Center(
        child: CircularProgressIndicator(), // Show loading indicator while camera initializes
      ),
    );
  }
}
