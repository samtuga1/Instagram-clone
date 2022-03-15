import 'package:flutter/material.dart';
import '../widgets/stories_grid.dart';
import '../widgets/user_post_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          //elevation: 1,
          title: Text('Instagram',
              style: Theme.of(context).textTheme.displayLarge),
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
        ListView(children: [
          SizedBox(
            height: 96,
            child: StoriesGrid(),
          ),
        ]),
        Expanded(
          child: UserPostItem(),
        )
      ],
    );
  }
}
