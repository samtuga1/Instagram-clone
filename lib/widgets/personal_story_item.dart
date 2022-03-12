import 'package:flutter/material.dart';

class PersonalStoryItem extends StatelessWidget {
  final String profileImage;
  const PersonalStoryItem({Key? key, required this.profileImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(26),
        child: Image.network(
          profileImage,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
      Positioned(
        left: 32,
        top: 29,
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(3),
          child: Container(
            height: 15,
            width: 15,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 13,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue[400],
            ),
          ),
        ),
      )
    ]);
  }
}
