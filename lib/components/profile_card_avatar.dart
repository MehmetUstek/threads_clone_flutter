import 'package:flutter/material.dart';

import '../styles/text_styles.dart';
import '../utils/utils.dart';

class ProfileCardAvatar extends StatelessWidget {
  const ProfileCardAvatar(
      {Key? key,
      required this.initials,
      this.profilePhotoPath,
      this.withoutAddButton = false,
      this.size,
      this.paddingToTheSide})
      : super(key: key);
  final String initials;
  final String? profilePhotoPath;
  final bool withoutAddButton;
  final Size? size;
  final double? paddingToTheSide;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingToTheSide ?? paddingToTheSides),
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
                        maximumSize: const Size(30, 30),
                        minimumSize: const Size(20, 20),
                        elevation: 2.0,
                        padding: const EdgeInsets.all(0.1),
                        shape: const CircleBorder(),
                        backgroundColor: Colors.black),
                    child: const Icon(
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
