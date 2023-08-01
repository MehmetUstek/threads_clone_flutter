import 'package:flutter/material.dart';

import '../styles/text_styles.dart';
import '../utils/utils.dart';

class ProfileCardAvatar extends StatelessWidget {
  const ProfileCardAvatar(
      {Key? key,
      required this.initials,
      this.profilePhotoPath,
      this.withoutAddButton = false,
      this.size})
      : super(key: key);
  final String initials;
  final String? profilePhotoPath;
  final bool withoutAddButton;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: paddingToTheSides),
      child: SizedBox(
        width: size?.width ?? 45,
        height: size?.height ?? 45,
        child: Stack(
          children: [
            profilePhotoPath != null
                ? CircleAvatar(
                    maxRadius: size?.width ?? double.infinity,
                    backgroundImage: NetworkImage(profilePhotoPath!),
                  )
                : CircleAvatar(
                    backgroundColor: Colors.orange.shade800,
                    child: Text(initials,
                        style: normalTextStyle(color: Colors.white)),
                  ),
            if (!withoutAddButton)
              Positioned(
                  bottom: -13,
                  right: -13,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        maximumSize: Size(30, 30),
                        minimumSize: Size(20, 20),
                        elevation: 2.0,
                        padding: EdgeInsets.all(0.1),
                        shape: CircleBorder(),
                        backgroundColor: Colors.black),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 10,
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}
