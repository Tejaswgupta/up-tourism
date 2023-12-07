import 'package:flutter/material.dart';
import 'package:nimisar_tourism/screens/dashboard.dart';
import 'package:nimisar_tourism/screens/maps.dart';
import 'package:nimisar_tourism/screens/search_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;

  List<Widget> _pages = [
    const DashboardPage(),
    const SearchPage(),
    MapSample(), //const MapSample(),
  ];

  void _onItemTapped(int index) {
    print('clicked');
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 36,
                    ),
                    SizedBox(height: 10),
                    Text('Tejasw Gupta'),
                    Text(
                      'Level: Pro',
                      style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text('Know the History'),
                onTap: () {},
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(Icons.search_rounded),
            ),
            BottomNavigationBarItem(
              label: 'Map',
              icon: Icon(Icons.pin_drop_outlined),
            ),
          ],
        ),
        body: _pages[_selectedIndex],
      ),
    );
  }
}
