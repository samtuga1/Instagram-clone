import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_post.dart';
import 'package:instagram_clone/widgets/app_bar.dart';
import 'package:provider/provider.dart';
import '../widgets/stories_grid.dart';
import '../widgets/user_post_item.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeScreenBar(),
        Expanded(
          child: ListView(
            children: [
              const SizedBox(
                height: 105,
                child: StoriesGrid(),
              ),
              ChangeNotifierProvider(
                create: ((context) => UserPosts()),
                child: const UserPostItem(),
              )
            ],
          ),
        )
      ],
    );
  }
}
