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
  
  // Method that returns the image url of the profile image
  String loadImage() {
    return widget.profileImageUrl;
  }
//Loads the image here before build() method is called
  @override
  void initState() {
    loadImage();
    super.initState();
  }

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
                height: 60,
                width: 60,
                child: Center(
                  child: Hero(
                    tag: widget.id,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(26),
                      child: Image.network(
                        loadImage(),
                        fit: BoxFit.cover,
                        height: 50,
                        width: 49.5,
                      ),
                    ),
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
