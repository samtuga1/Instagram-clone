import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_stories.dart';
import '../widgets/story_item_container.dart';
import 'package:provider/provider.dart';

class StoryItem extends StatelessWidget {
  final String id;
  const StoryItem({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final story = Provider.of<UserStories>(context).findById(id);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          GestureDetector(
            child: StoryItemContainer(
              profileImageUrl: story.profileImage,
              id: story.id,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            story.title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Divider(
            thickness: 2,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}
