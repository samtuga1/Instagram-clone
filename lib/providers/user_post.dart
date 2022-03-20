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
  void switchFav(String? id) {
    bool fav = isFavorite;
    UserPost user = UserPosts()._users.firstWhere((post) => post.id == id);
    fav = !fav;
    notifyListeners();
    print(user.isFavorite);
  }

  bool get favoriteStatus {
    return isFavorite;
  }
}

class UserPosts with ChangeNotifier {
  final List<UserPost> _users = [
    UserPost(
      likes: 790,
      id: 'm1',
      name: 'Samuel',
      profileImage: 'https://avatars.githubusercontent.com/u/79772304?v=4',
      postImage:
          'https://images.pexels.com/photos/11334018/pexels-photo-11334018.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    UserPost(
      likes: 32,
      id: 'm2',
      name: 'Bentil',
      profileImage: 'https://images.pexels.com/photos/9940538/pexels-photo-9940538.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      postImage:
          'https://images.pexels.com/photos/9802281/pexels-photo-9802281.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    UserPost(
      likes: 45,
      id: 'm3',
      name: 'Kelvin',
      profileImage: 'https://images.pexels.com/photos/5461428/pexels-photo-5461428.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      postImage:
          'https://images.pexels.com/photos/11362875/pexels-photo-11362875.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    UserPost(
      likes: 21,
      id: 'm3',
      name: 'Elvis',
      profileImage: 'https://images.pexels.com/photos/10144357/pexels-photo-10144357.png?auto=compress&cs=tinysrgb&dpr=1&w=500',
      postImage:
          'https://images.pexels.com/photos/9334434/pexels-photo-9334434.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
    UserPost(
      likes: 2,
      id: 'm3',
      name: 'Black',
      profileImage: 'https://images.pexels.com/photos/11129005/pexels-photo-11129005.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      postImage:
          'https://images.pexels.com/photos/11254088/pexels-photo-11254088.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
    ),
  ];
  List<UserPost> get users {
    return [..._users];
  }
}
