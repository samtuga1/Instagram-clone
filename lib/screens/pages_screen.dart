import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/user_image_container.dart';

class PagesSceen extends StatefulWidget {
  const PagesSceen({Key? key}) : super(key: key);

  @override
  State<PagesSceen> createState() => _PagesSceenState();
}

class _PagesSceenState extends State<PagesSceen> {
  final List _pages = const [
    HomeScreen(),
    Text('Hi'),
    Text('Hi'),
    Text('Hi'),
    Text('Hi'),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    scale: 1.9,
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
          BottomNavigationBarItem(
            label: 'Home',
            icon: ChangeNotifierProvider(
              create: ((context) => UserItem()),
              child: UserImageContainer(),
          )
          )],
      ),
    );
  }
}