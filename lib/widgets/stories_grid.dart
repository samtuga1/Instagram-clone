import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_stories.dart';
import '../widgets/story_item.dart';
import 'package:provider/provider.dart';

class StoriesGrid extends StatelessWidget {
  const StoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storiesData = Provider.of<UserStories>(context);
    final stories = storiesData.stories;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: storiesData.stories.length,
      itemBuilder: (context, i) => StoryItem(
        id: stories[i].id,
        images: stories[i].images,
        profileImageUrl: stories[i].profileImage,
        name: stories[i].title,
      ),
    );
  }
}
