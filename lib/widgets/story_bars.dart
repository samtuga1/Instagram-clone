import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/progress_bar.dart';

class StoryBars extends StatelessWidget {
  StoryBars(
      {Key? key,
      required this.percentWatchedList,
      required this.numberOfStoryImages})
      : super(key: key);
  final int numberOfStoryImages;
  List<double> percentWatchedList = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
          children: List.generate(
        numberOfStoryImages,
        (i) => Expanded(
          child: ProgressBar(
            percentWatched: percentWatchedList[i],
          ),
        ),
      )),
    );
  }
}
