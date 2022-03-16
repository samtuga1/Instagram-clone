import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_stories.dart';
import '../widgets/story_item.dart';
import 'package:provider/provider.dart';

class StoriesGrid extends StatelessWidget {
  const StoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storiesData = Provider.of<UserStories>(context).stories;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: storiesData.length,
      itemBuilder: (context, i) => StoryItem(
        id: storiesData[i].id,
      ),
    );
  }
}
