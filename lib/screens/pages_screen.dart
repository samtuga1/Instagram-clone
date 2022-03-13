import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/home_screen.dart';

class PagesSceen extends StatefulWidget {
  const PagesSceen({Key? key}) : super(key: key);

  @override
  State<PagesSceen> createState() => _PagesSceenState();
}

class _PagesSceenState extends State<PagesSceen> {
  List _pages = [HomeScreen(), Text('Hi'), Text('Hi'), Text('Hi'), Text('Hi')];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: _selectedIndex == 0
                ? Image.asset(
                    'assets/icons/home2.png',
                    scale: 1.1,
                  )
                : Image.asset(
                    'assets/icons/home.png',
                    scale: 1.1,
                  ),
          ),
          BottomNavigationBarItem(
            label: 'Search',
            icon: Image.asset(
              'assets/icons/search.png',
              scale: 1.1,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Reels',
            icon: Image.asset(
              'assets/icons/reels.png',
              scale: 1.1,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Bag',
            icon: Image.asset(
              'assets/icons/bag.png',
              scale: 1.1,
            ),
          ),
          const BottomNavigationBarItem(
            label: 'Home',
            icon: CircleAvatar(
              radius: 11,
            ),
          ),
        ],
      ),
    );
  }
}
