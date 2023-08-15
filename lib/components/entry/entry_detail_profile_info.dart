import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../profile_card_avatar.dart';
import 'entry_username.dart';

class EntryDetailProfileInfo extends StatelessWidget {
  const EntryDetailProfileInfo(
      {Key? key,
      required this.initials,
      this.profilePhotoPath,
      required this.username,
      required this.isVerifiedUser})
      : super(key: key);
  final String initials;
  final String? profilePhotoPath;
  final String username;
  final bool isVerifiedUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: paddingToTheSides, right: paddingToTheSides),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileCardAvatar(
              initials: initials,
              profilePhotoPath: profilePhotoPath,
              paddingToTheSide: 0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingToTheSides),
            child: EntryUsername(
                username: username, isVerifiedUser: isVerifiedUser),
          ),
        ],
      ),
    );
  }
}
