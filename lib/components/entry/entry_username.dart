import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../pages/user_profile_page.dart';
import '../../utils/utils.dart';

class EntryUsername extends StatelessWidget {
  const EntryUsername(
      {Key? key, required this.username, required this.isVerifiedUser})
      : super(key: key);
  final String username;
  final bool isVerifiedUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => pushToNewPage(
              context,
              UserProfilePage(
                username: username,
              )),
          child: Text(
            username,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        if (isVerifiedUser)
          const Padding(
            padding: EdgeInsets.only(left: blueTickLeftPadding),
            child: Icon(
              CupertinoIcons.check_mark_circled_solid,
              color: Colors.blue,
              size: 15,
            ),
          ),
      ],
    );
  }
}
