import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/personal_story_item.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';

class StoryItemContainer extends StatelessWidget {
  const StoryItemContainer({
    Key? key,
    required this.profileImageUrl,
    required this.watchedAllStories,
    required this.id,
  }) : super(key: key);

  final String profileImageUrl;
  final Object? watchedAllStories;
  final String id;

  @override
  Widget build(BuildContext context) {
    return id == 'm1'
        ? PersonalStoryItem(
            profileImage: profileImageUrl,
          )
        : OutlineGradientButton(
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
            gradient: LinearGradient(
              colors: watchedAllStories == true
                  ? [Colors.grey, Colors.grey]
                  : [Colors.pink, Colors.yellow],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            strokeWidth: 2,
            padding: EdgeInsets.zero,
            radius: const Radius.circular(35),
          );
  }
}
