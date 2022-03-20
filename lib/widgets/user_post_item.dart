import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_post.dart';
import 'package:provider/provider.dart';

class UserPostItem extends StatelessWidget {
  const UserPostItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userPost = Provider.of<UserPosts>(context, listen: false);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: userPost.users.length,
      itemBuilder: (context, i) {
        // final singleUserPost = userPost.users.firstWhere((post) => post.id == userPost.users[i].id);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(userPost.users[i].profileImage!),
                        ),
                      ),
                      Text(
                        userPost.users[i].name!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const Icon(Icons.more_horiz)
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 330,
              child: Image.network(
                userPost.users[i].postImage!,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Consumer<UserPost>(
                        builder: (_, post, child) => GestureDetector(
                          onTap: () {
                            //Update the likes count 
                          },
                          child: const Icon(Icons.favorite_outline),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/icons/chat.png',
                        scale: 1.4,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/icons/send.png',
                        scale: 1.3,
                      ),
                    ],
                  ),
                  const Icon(Icons.bookmark_outline),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 10, bottom: 8),
              child: Text('${userPost.users[i].likes} likes',
                  style: Theme.of(context).textTheme.bodySmall),
            ),
            Row(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage(userPost.users[i].profileImage!),
                      radius: 10,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Add a comment...',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            )
          ],
        );
      },
    );
  }
}
