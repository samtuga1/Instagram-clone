import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({Key? key}) : super(key: key);

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  bool animate = true;

  @override
  void dispose() {
    animate = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Lottie.network(
            'https://assets4.lottiefiles.com/packages/lf20_4s3kvfcn.json',
            animate: animate),
      ),
    );
  }
}