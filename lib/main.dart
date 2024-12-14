<<<<<<< HEAD
import 'package:ecomitra_frontend/Admin/admin_location.dart';
import 'package:flutter/material.dart';
=======
import 'package:flutter/material.dart';
import 'package:myapp/widgets/navbar.dart';

>>>>>>> 8b4c323 (completed AI)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Set AdminNavigation as the home screen
      home: MapPage(),
    );
  }
}
=======

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme()),
      home: const  MainLayout(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.green,
        leadingWidth: 80,
        leading: const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey,
          ),
        ),
        title: Row(children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to Eco Mitra',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('Rahul' 'Wasti'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
                size: 34.0,
              ),
              onPressed: () {
                // Handle notification icon press
              },
            ),
          )
        ]),
      ),
      body: SingleChildScrollView(
          child: Column(
              children: [
                // Search bar
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),

                // E-Waste collection announcement
                Card(
                  child: Container(
                    width: 360,
                    height: 160,
                    padding: const EdgeInsets.all(0),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    child: SizedBox(
                      height: 200, // Height of the card
                      child: PageView.builder(
                        itemCount: 3, // Number of cards
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.blueAccent, // Background color for the card
                              borderRadius: BorderRadius.circular(11.0),
                            ),
                            child: Center(
                              child: Text(
                                'Card ${index + 1}',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Text color
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    width: 360,
                    height: 200,

                    child: Column(
                        children: [ const SizedBox(
                          width: 360,
                          height: 40,
                          child: Text("WasteCare Map", style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),),

                          Container(width: 360,
                              height: 160,
                              decoration: BoxDecoration(color: Colors.green,
                                borderRadius: BorderRadius.circular(
                                    11.0), // Match the card's border radius ), )

                              )
                          )
                        ]
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    width: 360,
                    height: 200,

                    child: Column(
                        children: [ const SizedBox(
                          width: 360,
                          height: 40,
                          child: Text("Schedule Calender", style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),),

                          Container(
                            width: 360,
                            height: 160,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(
                                  11.0), // Match the card's border radius
                            ),
                          ),
                        ]
                    ),

                  ),
                )

              ]
          )

      ),
    );
  }

}
>>>>>>> 8b4c323 (completed AI)
