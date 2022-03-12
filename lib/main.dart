import 'package:flutter/material.dart';
import './providers/user_stories.dart';
import './screens/story_screen.dart';
import 'package:provider/provider.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserStories(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      routes: {
        StoryScreen.id: (ctx) => const StoryScreen(),
      },
      home: const HomeScreen(),
    ),
  ));
}
