import 'package:flutter/cupertino.dart';

class UserStory {
  final String? id;
  final String? title;
  final String? profileImage;
  final List<String>? images;

  UserStory({
    this.id,
    this.title,
    this.profileImage,
    this.images,
  });
}

class UserStories with ChangeNotifier {
  final List<UserStory> _stories = [
    UserStory(
      id: 'm1',
      title: 'Samuel',
      profileImage:
          'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
      images: [
        'https://images.pexels.com/photos/11235613/pexels-photo-11235613.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'https://images.pexels.com/photos/11289200/pexels-photo-11289200.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      ],
    ),
    UserStory(
      id: 'm2',
      title: 'Adelaide',
      profileImage:
          'https://images.pexels.com/photos/11358793/pexels-photo-11358793.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      images: [
        'https://images.pexels.com/photos/11299618/pexels-photo-11299618.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'https://images.pexels.com/photos/8664598/pexels-photo-8664598.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'https://images.pexels.com/photos/10656142/pexels-photo-10656142.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
      ],
    ),
    UserStory(
      id: 'm3',
      title: 'the_boybreyy',
      profileImage:
          'https://images.pexels.com/photos/11362875/pexels-photo-11362875.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      images: [
        'https://images.pexels.com/photos/11357654/pexels-photo-11357654.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'https://images.pexels.com/photos/11384151/pexels-photo-11384151.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      ],
    ),
    UserStory(
      id: 'm4',
      title: 'Baaba',
      profileImage:
          'https://images.pexels.com/photos/10283734/pexels-photo-10283734.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      images: [
        'https://images.pexels.com/photos/11274650/pexels-photo-11274650.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'https://images.pexels.com/photos/10283734/pexels-photo-10283734.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      ],
    ),
    UserStory(
      id: 'm5',
      title: 'Sonny',
      profileImage:
          'https://images.pexels.com/photos/2870928/pexels-photo-2870928.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      images: [
        'https://images.pexels.com/photos/11354017/pexels-photo-11354017.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'https://images.pexels.com/photos/10492003/pexels-photo-10492003.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
        'https://images.pexels.com/photos/4090269/pexels-photo-4090269.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'
      ],
    ),
    UserStory(
      id: 'm6',
      title: 'Hertha',
      profileImage:
          'https://images.pexels.com/photos/4972975/pexels-photo-4972975.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      images: [
        'https://images.pexels.com/photos/10878696/pexels-photo-10878696.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
      ],
    ),
  ];
  List<UserStory> get stories {
    return [..._stories];
  }

  void moveToNextStory() {
    var currentImage = 0;
    _stories[currentImage++];
    notifyListeners();
  }

  UserStory findById(id) {
    return _stories.firstWhere((story) => id == story.id);
  }

  void watches(String id) {
    _stories.firstWhere((story) {
      return id == story.id;
    });
    notifyListeners();
  }
}
