import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/screens/reels_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';
import 'package:instagram_clone/screens/shop_screen.dart';
import 'package:provider/provider.dart';
import '../widgets/app_bar.dart';
import '../widgets/user_image_container.dart';

class PagesSceen extends StatefulWidget {
  const PagesSceen({Key? key}) : super(key: key);

  @override
  State<PagesSceen> createState() => _PagesSceenState();
}

class _PagesSceenState extends State<PagesSceen> {
  final List _pages = const [
    HomeScreen(),
    SearchScreen(),
    ReelsScreen(),
    ShopScreen(),
    ProfileScreen()
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
      body: Column(
        children: [
          Visibility(
            visible: _selectedIndex == 0 ? true : false,
            child: HomeScreenBar(),
          ),
          _pages[_selectedIndex],
        ],
      ),
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
              ))
        ],
      ),
    );
  }
}
