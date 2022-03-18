import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
