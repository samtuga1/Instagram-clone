import 'package:flutter/material.dart';

class HomeScreenBar extends StatelessWidget {
  const HomeScreenBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: SizedBox(
        height: 85,
        width: 120,
        child: Image.asset(
          "assets/icons/instagram-text.png",
        ),
      ),
      actions: [
        GestureDetector(
          child: Image.asset(
            'assets/icons/add.png',
            scale: 1,
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
    );
  }
}
