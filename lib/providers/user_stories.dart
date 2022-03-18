import 'package:flutter/cupertino.dart';

class UserStory {
  final String id;
  final String title;
  final String profileImage;
  final List<String> images;

  UserStory({
    required this.id,
    required this.title,
    required this.profileImage,
    required this.images,
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
        'https://ichef.bbci.co.uk/news/976/cpsprodpb/13F00/production/_95146618_bills.jpg',
        'https://ichef.bbci.co.uk/news/976/cpsprodpb/13F00/production/_95146618_bills.jpg',
      ],
    ),
    UserStory(
      id: 'm2',
      title: 'Samuel',
      profileImage:
          'https://iso.500px.com/wp-content/uploads/2015/03/business_cover.jpeg',
      images: [
        'https://ichef.bbci.co.uk/news/976/cpsprodpb/13F00/production/_95146618_bills.jpg',
        'https://ichef.bbci.co.uk/news/976/cpsprodpb/13F00/production/_95146618_bills.jpg',
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
