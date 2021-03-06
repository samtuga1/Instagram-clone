import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/user_post.dart';
import '../screens/pages_screen.dart';
import './providers/user_stories.dart';
import './screens/story_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserStories(),
      ),
      ChangeNotifierProvider<UserPost>(
        create: (context) => UserPost(),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          labelSmall: GoogleFonts.poppins(
            textStyle: const TextStyle(fontWeight: FontWeight.w500),
          ),
          bodySmall: GoogleFonts.poppins(
            textStyle: const TextStyle(fontWeight: FontWeight.w300),
          ),
          bodyMedium: GoogleFonts.poppins(
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      routes: {
        StoryScreen.id: (ctx) => const StoryScreen(),
      },
      home: const PagesSceen(),
    ),
  ));
}
