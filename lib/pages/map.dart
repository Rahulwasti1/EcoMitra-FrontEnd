import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.green,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: BackButton(onPressed: (){

            } ),
          ),
          title: const Text('Map',
              style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold,) )

      ),
      body: const Center(
        child: Text(
          'Welcome to the News Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}