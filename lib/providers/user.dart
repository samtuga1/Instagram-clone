import 'package:flutter/cupertino.dart';

class User {
  final String id;
  final String profileImage;
  final String name;

  User({
    required this.id,
    required this.profileImage,
    required this.name,
  });
}

class UserItem with ChangeNotifier {
  User userItem = User(
    id: DateTime.now().toString(), 
    profileImage: 'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg', 
    name: 'Samuel Twumasi',
    );
}
