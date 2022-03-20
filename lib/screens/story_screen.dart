import 'dart:async';
import 'package:instagram_clone/providers/user_stories.dart';
import 'package:instagram_clone/providers/user_stories.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/story_bars.dart';
import '../widgets/story_screen_textfield.dart';

class StoryScreen extends StatefulWidget {
  static const id = '/story_screen';
  const StoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  var _currentImageIndex = 0;
  List<double> percentWatched = [];
  late List<String> images;
  late UserStory story;
  late Timer time;

  //This is where my story timer starts to render(In didChangeDependencies which builds just after initState builds)
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments
        as List; //Fetches the id from StoryItem.dart
    final storyId = args[0];
    int heroCount = args[1];
    story = Provider.of<UserStories>(context).findById(storyId);
    images = story.images!;

    for (int i = 0; i < images.length; i++) {
      percentWatched.add(0);
    }
    super.didChangeDependencies();
    _startWatching();
  }

  //This method manages the processes of the timer
  void _startWatching() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      time = timer;
      setState(() {
        if (percentWatched[_currentImageIndex] + 0.01 < 1) {
          percentWatched[_currentImageIndex] += 0.01;
        } else {
          percentWatched[_currentImageIndex] = 1;
          time.cancel();

          if (_currentImageIndex < images.length - 1) {
            _currentImageIndex++;
            _startWatching();
          } else {
            Navigator.of(context).pop(true);
          }
        }
      });
    });
  }

  // This method is what manages the area of the screen I tap on the screen to navigate my stories
  void _onTapDown(TapDownDetails details) {
    final double sreenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < sreenWidth / 2) {
      setState(() {
        if (_currentImageIndex == 0) {
          percentWatched[_currentImageIndex] = 0;
        }
        if (_currentImageIndex > 0) {
          percentWatched[_currentImageIndex - 1] = 0;
          percentWatched[_currentImageIndex] = 0;
          _currentImageIndex--;
        }
      });
    } else {
      setState(() {
        if (_currentImageIndex < images.length - 1) {
          percentWatched[_currentImageIndex] = 1;
          _currentImageIndex++;
        } else {
          percentWatched[_currentImageIndex] = 1;
        }
      });
    }
  }

  Object? watchedLastStory() {
    if (_currentImageIndex == images.length - 1) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    time.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 18),
                    child: Hero(
                      tag: 'post-Image',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.network(
                          images[_currentImageIndex],
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
                const StoryScreenTextField()
              ],
            ),
            Column(
              children: [
                StoryBars(
                  numberOfStoryImages: images.length,
                  percentWatchedList: percentWatched,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0, left: 5, right: 5),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(story.profileImage!),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            story.title!,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            '23h',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                            color: Colors.white,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_horiz,
                            ),
                          ),
                          IconButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.of(context).pop(watchedLastStory());
                            },
                            icon: const Icon(
                              Icons.close,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
