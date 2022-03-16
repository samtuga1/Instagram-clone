import 'package:flutter/material.dart';
import '../providers/user.dart';
import 'package:provider/provider.dart';

class UserImageContainer extends StatelessWidget {
  const UserImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final image = Provider.of<UserItem>(context);
    return CircleAvatar(
      radius: 11,
      backgroundImage: NetworkImage(image.userItem.profileImage),
    );
  }
}
