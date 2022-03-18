import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserPost with ChangeNotifier {
  final String? id;
  final String? name;
  final String? profileImage;
  final String? postImage;
  bool isFavorite;
  final int? likes;

  UserPost({
    this.likes,
    this.profileImage,
    this.id,
    this.name,
    this.postImage,
    this.isFavorite = false,
  });
  void switchFav(String? id, int i) {
    if (UserPosts()._users[i].id == id) {
      isFavorite = !isFavorite;
      notifyListeners();
    } else {
      print('not');
      print(UserPost().id);
    }
  }
}

class UserPosts with ChangeNotifier {
  final List<UserPost> _users = [
    UserPost(
      likes: 32,
      id: 'm1',
      name: 'Samuel',
      profileImage: 'https://avatars.githubusercontent.com/u/79772304?v=4',
      postImage:
          'https://user-images.githubusercontent.com/79772304/154733047-5dcb4c0d-4ff7-497e-9a66-28c2b765847a.png',
      isFavorite: false,
    ),
    UserPost(
      likes: 32,
      id: 'm1',
      name: 'Samuel',
      profileImage: 'https://avatars.githubusercontent.com/u/79772304?v=4',
      postImage:
          'https://user-images.githubusercontent.com/79772304/152646045-a3ffc16c-0e11-4606-9f17-52326fe9a7da.png',
      isFavorite: false,
    ),
    UserPost(
      likes: 32,
      id: 'm1',
      name: 'Samuel',
      profileImage: 'https://avatars.githubusercontent.com/u/79772304?v=4',
      postImage:
          'https://user-images.githubusercontent.com/79772304/150697981-a080220c-21ee-4b24-b10c-8b3371c8991d.png',
      isFavorite: false,
    ),
    // UserPost(
    //   likes: 32,
    //   id: 'm1',
    //   name: 'Samuel',
    //   profileImage:
    //       'https://images.hindustantimes.com/rf/image_size_960x540/HT/p2/2017/04/14/Pictures/_2596589e-20ee-11e7-beb7-f1cbdf0743d8.jpg',
    //   postImage:
    //       'https://images.hindustantimes.com/rf/image_size_960x540/HT/p2/2017/04/14/Pictures/_2596589e-20ee-11e7-beb7-f1cbdf0743d8.jpg',
    //   isFavorite: false,
    // ),
  ];
  List<UserPost> get users {
    return [..._users];
  }

  // void switchFav(String id) {
  //   final user = _users.firstWhere((userPost) => userPost.id == id);
  //   user.isFavorite = !user.isFavorite;
  //   notifyListeners();
  // }
}
