import 'dart:async';

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
  var _currentImage = 0;
  List<double> percentWatched = [];
  late List<String> images;
  @override
  void didChangeDependencies() {
    images = ModalRoute.of(context)?.settings.arguments as List<String>;
    for (int i = 0; i < images.length; i++) {
      percentWatched.add(0);
    }
    super.didChangeDependencies();
    _startWatching();
  }

  void _startWatching() {
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (percentWatched[_currentImage] + 0.01 < 1) {
        setState(() {
          percentWatched[_currentImage] += 0.01;
        });
      } else {
        setState(() {
          _currentImage++;
        });
      }
      if (_currentImage == images.length) {
        timer.cancel();
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  images[_currentImage],
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 30,
              color: Colors.purple,
            )
          ],
        ),
        StoryBars(
          percentWatchedList: percentWatched,
        ),
      ]),
    );
  }
}