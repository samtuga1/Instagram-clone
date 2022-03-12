import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/personal_story_item.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import '../screens/story_screen.dart';

class StoryItemContainer extends StatefulWidget {
  StoryItemContainer({
    Key? key,
    required this.profileImageUrl,
    required this.id,
  }) : super(key: key);

  final String profileImageUrl;
  Object? watchedAllStories;
  final String id;

  @override
  State<StoryItemContainer> createState() => _StoryItemContainerState();
}

class _StoryItemContainerState extends State<StoryItemContainer> {
  @override
  Widget build(BuildContext context) {
    return widget.id == 'm1'
        ? PersonalStoryItem(
            profileImage: widget.profileImageUrl,
          )
        : GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(StoryScreen.id, arguments: widget.id)
                  .then((watchedEverything) {
                setState(() {
                  widget.watchedAllStories = watchedEverything;
                });
              });
            },
            child: OutlineGradientButton(
              child: SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: CircleAvatar(
                    radius: 21.2,
                    backgroundImage: NetworkImage(widget.profileImageUrl),
                  ),
                ),
              ),
              gradient: LinearGradient(
                colors: widget.watchedAllStories == true
                    ? [Colors.grey, Colors.grey]
                    : [Colors.pink, Colors.yellow],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
              strokeWidth: 2,
              padding: EdgeInsets.zero,
              radius: const Radius.circular(35),
            ),
          );
  }
}
