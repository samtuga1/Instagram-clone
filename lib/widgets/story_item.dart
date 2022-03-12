import 'package:flutter/material.dart';
import '../screens/story_screen.dart';
import '../widgets/story_item_container.dart';

class StoryItem extends StatefulWidget {
  final String id;
  final String profileImageUrl;
  final String name;
  final List<String> images;
  StoryItem({
    Key? key,
    required this.id,
    required this.images,
    required this.profileImageUrl,
    required this.name,
  }) : super(key: key);

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  Object? _watchedAllStories = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(StoryScreen.id, arguments: widget.id)
                  .then((watchedAll) => {
                        setState(() {
                          _watchedAllStories = watchedAll;
                        })
                      });
            },
            child: StoryItemContainer(
                profileImageUrl: widget.profileImageUrl,
                watchedAllStories: _watchedAllStories),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(widget.name)
        ],
      ),
    );
  }
}
