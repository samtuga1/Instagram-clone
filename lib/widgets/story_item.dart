import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_stories.dart';
import '../screens/story_screen.dart';
import '../widgets/story_item_container.dart';
import 'package:provider/provider.dart';

class StoryItem extends StatelessWidget {
  final String id;
  StoryItem({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final story = Provider.of<UserStories>(context).findById(id);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(StoryScreen.id, arguments: id);
            },
            child: StoryItemContainer(
              profileImageUrl: story.profileImage,
              watchedAllStories: story.watchedAll,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(story.title)
        ],
      ),
    );
  }
}
