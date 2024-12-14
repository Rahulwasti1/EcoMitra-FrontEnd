import 'package:myapp/pages/map.dart';
import 'package:myapp/pages/profile.dart';
import 'package:myapp/pages/recyclewaste.dart';
import 'package:myapp/pages/report.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MyHomePage(), // Call your HomeScreen class
    const ReportPage(), // Call your ReportScreen class
    const MapPage(), // Call your MapScreen class
    const RecPage(), // Call your WasteScreen class
    const ProfilePage(), // Call your ProfileScreen class
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed the appBar here
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.recycling),
            label: 'Waste',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.green,
      ),
    );
  }
}