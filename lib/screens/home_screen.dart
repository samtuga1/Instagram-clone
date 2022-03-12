import 'package:flutter/material.dart';
import '../widgets/stories_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title:
            Text('Instagram', style: Theme.of(context).textTheme.displayLarge),
        actions: [
          GestureDetector(
            child: Image.asset(
              'assets/icons/add.png',
              scale: 2.4,
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
