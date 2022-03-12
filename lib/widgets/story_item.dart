import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_stories.dart';
import '../screens/story_screen.dart';
import '../widgets/story_item_container.dart';
import 'package:provider/provider.dart';

class StoryItem extends StatefulWidget {
  final String id;
  Object? watchedAll;
  StoryItem({
    Key? key,
    required this.id,
    this.watchedAll,
  }) : super(key: key);

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  @override
  Widget build(BuildContext context) {
    final story = Provider.of<UserStories>(context).findById(widget.id);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(StoryScreen.id, arguments: widget.id)
                  .then((watchedEverything) {
                setState(() {
                  widget.watchedAll = watchedEverything;
                });
              });
            },
            child: StoryItemContainer(
              watchedAllStories: widget.watchedAll,
              profileImageUrl: story.profileImage,
              id: story.id,
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
