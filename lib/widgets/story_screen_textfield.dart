import 'package:flutter/material.dart';

class StoryScreenTextField extends StatelessWidget {
  const StoryScreenTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  borderSide: const BorderSide(color: Colors.white, width: 0.7),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white, width: 0.7),
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
        ),
        const Icon(
          Icons.favorite_outline,
          color: Colors.white,
          size: 27,
        ),
        const SizedBox(
          width: 20,
        ),
        Image.asset(
          'assets/icons/send.png',
          scale: 1.1,
          color: Colors.white,
        ),
        const SizedBox(
          width: 20,
        )
      ]),
    );
  }
}
