import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBar extends StatelessWidget {
  ProgressBar({Key? key, required this.percentWatched}) : super(key: key);

  double percentWatched = 0;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      barRadius: const Radius.circular(10),
      lineHeight: 2,
      percent: percentWatched,
      progressColor: Colors.grey[400],
      backgroundColor: Colors.grey[600],
    );
  }
}
