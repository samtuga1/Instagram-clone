import 'dart:async';
import 'package:instagram_clone/providers/user_stories.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/story_bars.dart';

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
    final storyId = ModalRoute.of(context)?.settings.arguments
        as String; //Fetches the id from StoryItem.dart
    story = Provider.of<UserStories>(context).findById(storyId);
    images = story.images;

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

  bool watchedLastStory() {
    if (_currentImageIndex == images.length) {
      return true;
    } else {
      return false;
    }
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
        body: Stack(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 18),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(7),
                    ),
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
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 20, left: 20),
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(color: Colors.white),
                          labelText: 'Send message',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.7),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.7),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.favorite_outline,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.message_outlined,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 20,
                  )
                ]),
              )
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
                          backgroundImage: NetworkImage(story.profileImage),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          story.title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
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
                          icon: Icon(
                            Icons.more_horiz,
                          ),
                        ),
                        IconButton(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).pop(watchedLastStory());
                          },
                          icon: Icon(
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
    );
  }
}
