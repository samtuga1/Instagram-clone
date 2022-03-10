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
  var _currentImageIndex = 0;
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
      setState(() {
        if (percentWatched[_currentImageIndex] + 0.01 < 1) {
          percentWatched[_currentImageIndex] += 0.01;
        } else {
          percentWatched[_currentImageIndex] = 1;
          timer.cancel();

          if (_currentImageIndex < images.length - 1) {
            _currentImageIndex++;
            _startWatching();
          } else {
            Navigator.pop(context);
          }
        }
      });
    });
  }

  void _onTapDown(TapDownDetails details) {
    final double sreenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    if (dx < sreenWidth / 2) {
      setState(() {
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        body: Stack(children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Image.network(
                    images[_currentImageIndex],
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
      ),
    );
  }
}
