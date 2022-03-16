import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserPost {
  final String id;
  final String name;
  final String profileImage;
  final String postImage;
  bool isFavorite;
  final int likes;

  UserPost({
    required this.likes,
    required this.profileImage,
    required this.id,
    required this.name,
    required this.postImage,
    this.isFavorite = false,
  });
}

class UserPosts with ChangeNotifier {
  final List<UserPost> _users = [
    UserPost(
      likes: 32,
      id: 'm1',
      name: 'Samuel',
      profileImage:
          'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
      postImage:
          'https://ichef.bbci.co.uk/news/976/cpsprodpb/13F00/production/_95146618_bills.jpg',
    ),
    UserPost(
      likes: 32,
      id: 'm1',
      name: 'Samuel',
      profileImage:
          'https://images.ctfassets.net/hrltx12pl8hq/3AnnkVqrlhrqb9hjlMBzKX/693a8e5d40b4b6c55a7673ca4c807eef/Girl-Stock?fit=fill&w=480&h=270',
      postImage:
          'https://images.ctfassets.net/hrltx12pl8hq/3AnnkVqrlhrqb9hjlMBzKX/693a8e5d40b4b6c55a7673ca4c807eef/Girl-Stock?fit=fill&w=480&h=270',
    ),
    UserPost(
      likes: 32,
      id: 'm1',
      name: 'Samuel',
      profileImage:
          'https://static.independent.co.uk/2020/09/18/11/stock%20model%201.jpg?quality=75&width=1200&auto=webp',
      postImage:
          'https://static.independent.co.uk/2020/09/18/11/stock%20model%201.jpg?quality=75&width=1200&auto=webp',
    ),
    UserPost(
      likes: 32,
      id: 'm1',
      name: 'Samuel',
      profileImage:
          'https://images.hindustantimes.com/rf/image_size_960x540/HT/p2/2017/04/14/Pictures/_2596589e-20ee-11e7-beb7-f1cbdf0743d8.jpg',
      postImage:
          'https://images.hindustantimes.com/rf/image_size_960x540/HT/p2/2017/04/14/Pictures/_2596589e-20ee-11e7-beb7-f1cbdf0743d8.jpg',
    ),
  ];
  List<UserPost> get users {
    return [..._users];
  }
}
