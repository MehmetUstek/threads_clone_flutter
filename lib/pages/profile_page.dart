import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/card_button.dart';
import 'package:threads_clone/pages/settings_page.dart';
import 'package:threads_clone/styles/text_styles.dart';

import '../utils/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    required this.username,
    required this.userBio,
    required this.fullName,
    required this.followerCount,
    this.profilePhotoPath,
  });
  final String username;
  final String fullName;
  final String userBio;
  final int followerCount;
  final String? profilePhotoPath;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isThreadTab = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(child: Icon(CupertinoIcons.lock)),
                InkWell(
                  child: Icon(Icons.menu),
                  onTap: () => {pushToNewPage(context, SettingsPage())},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 15),
            child: Text(
              widget.fullName,
              style: smallHeader(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15),
            child: Text(
              widget.username,
              style: usernameTextStyle(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15),
            child: Text(
              widget.userBio,
              style: usernameTextStyle(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Text(
              "${widget.followerCount} followers",
              style: smallText(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardButton(
                  buttonTitle: 'Edit Profile',
                  fixedWidth: screenWidth(context) / 2.4,
                ),
                CardButton(
                  buttonTitle: 'Share Profile',
                  fixedWidth: screenWidth(context) / 2.4,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: screenWidth(context) / 5),
                        child: Text(
                          "Threads",
                          style: titleTextStyle(
                              color: isThreadTab ? Colors.black : Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: screenWidth(context) / 2,
                          height: 0.5,
                          color: isThreadTab ? Colors.black : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => {setState(() => isThreadTab = true)},
                  splashFactory: NoSplash.splashFactory,
                ),
                InkWell(
                  child: Column(
                    children: [
                      Text(
                        "Replies",
                        style: titleTextStyle(
                            color: isThreadTab ? Colors.grey : Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                          width: screenWidth(context) / 2,
                          height: 0.5,
                          color: isThreadTab ? Colors.grey : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => {setState(() => isThreadTab = false)},
                  splashFactory: NoSplash.splashFactory,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
