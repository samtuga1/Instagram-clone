import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/progress_bar.dart';

class StoryBars extends StatelessWidget {
  StoryBars({Key? key, required this.percentWatchedList}) : super(key: key);

  List<double> percentWatchedList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(children: [
        Expanded(
          child: ProgressBar(
            percentWatched: percentWatchedList[0],
          ),
        ),
        Expanded(
          child: ProgressBar(
            percentWatched: percentWatchedList[1],
          ),
        ),
      ]),
    );
  }
}
