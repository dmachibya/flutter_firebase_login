import 'package:sample_app/screens/landing_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  int navIndex;
  HomeScreen({Key? key, required this.navIndex}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> screens = [ LandingScreen(), Text("Page 2"), Text("Page 2")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _bottomNavTap,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Page 2"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Page 3"),
          ]),
    );
  }

  void _bottomNavTap(index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
