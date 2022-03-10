import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_stories.dart';
import 'package:instagram_clone/screens/story_screen.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UserStories(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      routes: {
        StoryScreen.id: (ctx) => const StoryScreen(),
      },
      home: const HomeScreen(),
    ),
  ));
}
