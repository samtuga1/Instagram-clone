import 'package:flutter/material.dart';
import '../widgets/stories_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Instagram',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            child: Image.asset(
              'assets/icons/add.png',
              scale: 2.2,
            ),
          ),
          GestureDetector(
            child: Image.asset(
              'assets/icons/favorite.png',
              scale: 1,
            ),
          ),
          GestureDetector(
            child: Image.asset(
              'assets/icons/message.png',
              scale: 1,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 88,
            child: StoriesGrid(),
          ),
        ],
      ),
    );
  }
}
