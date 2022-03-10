import 'package:flutter/material.dart';
import '../screens/story_screen.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class StoryItem extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final List<String> images;
  const StoryItem({
    Key? key,
    required this.images,
    required this.profileImageUrl,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Column(
        children: [
          Stack(children: [
            OutlineGradientButton(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(StoryScreen.id, arguments: images);
              },
              child: const SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: Text('hi'),
                ),
              ),
              gradient: const LinearGradient(
                colors: [Colors.pink, Colors.yellow],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              strokeWidth: 2,
              padding: EdgeInsets.zero,
              radius: const Radius.circular(35),
            ),
            Positioned(
              top: 3.4,
              left: 3.7,
              child: Container(
                height: 43,
                width: 43,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(profileImageUrl),
                  ),
                ),
              ),
            )
          ]),
          const SizedBox(
            height: 5,
          ),
          Text(name)
        ],
      ),
    );
  }
}
