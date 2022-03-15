import 'package:flutter/material.dart';

class UserPostItem extends StatelessWidget {
  const UserPostItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, i) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 15,
            ),
            title: Text('Samuel'),
            subtitle: Text('Accra, Legon'),
            trailing: Icon(Icons.more_horiz),
          ),
          Container(
            height: 400,
            color: Colors.blue,
          ),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border_outlined),
                  Icon(Icons.favorite_border_outlined),
                  Icon(Icons.favorite_border_outlined)
                ],
              ),
              const Spacer(),
              Icon(Icons.bookmark)
            ],
          ),
          Text('49 likes'),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'Samuel'),
                TextSpan(text: 'Description')
              ],
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 10,
                  ),
                  Text('Add a comment'),
                ],
              ),
              Spacer(),
              RichText(
                text: TextSpan(
                  children: [TextSpan(text: '♥'), TextSpan(text: '🙌')],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
