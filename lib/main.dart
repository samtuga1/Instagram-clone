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
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontFamily: 'Norican',
            fontSize: 35,
          ),
          bodySmall: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w300,
            fontSize: 13,
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ),
      routes: {
        StoryScreen.id: (ctx) => const StoryScreen(),
      },
      home: const HomeScreen(),
    ),
  ));
}
