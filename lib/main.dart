import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    home: const HomeScreen(),
  ));
}
