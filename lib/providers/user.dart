import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class User {
  final String id;
  final String name;
  final String profileImage;
  final String imageUrl;
  bool isFavorite;

  User({
    required this.profileImage,
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isFavorite = false,
  });
}

class UserPost with ChangeNotifier {
  final List<User> _users = [
    User(
      id: 'm1',
      name: 'Samuel',
      profileImage:
          'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
      imageUrl:
          'https://ichef.bbci.co.uk/news/976/cpsprodpb/13F00/production/_95146618_bills.jpg',
    ),
    User(
      id: 'm1',
      name: 'Samuel',
      profileImage:
          'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
      imageUrl:
          'https://ichef.bbci.co.uk/news/976/cpsprodpb/13F00/production/_95146618_bills.jpg',
    ),
    User(
      id: 'm1',
      name: 'Samuel',
      profileImage:
          'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
      imageUrl:
          'https://ichef.bbci.co.uk/news/976/cpsprodpb/13F00/production/_95146618_bills.jpg',
    ),
    User(
      id: 'm1',
      name: 'Samuel',
      profileImage:
          'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
      imageUrl:
          'https://ichef.bbci.co.uk/news/976/cpsprodpb/13F00/production/_95146618_bills.jpg',
    )
  ];
  List<User> get users {
    return [..._users];
  }
}
