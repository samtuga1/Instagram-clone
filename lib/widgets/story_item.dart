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
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(StoryScreen.id, arguments: images);
            },
            child: OutlineGradientButton(
              child: SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: CircleAvatar(
                    radius: 21.2,
                    backgroundImage: NetworkImage(profileImageUrl),
                  ),
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
          ),
          const SizedBox(
            height: 5,
          ),
          Text(name)
        ],
      ),
    );
  }
}
