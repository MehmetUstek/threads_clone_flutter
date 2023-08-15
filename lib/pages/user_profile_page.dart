import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/components/back_icon.dart';
import 'package:threads_clone/components/card_button.dart';
import 'package:threads_clone/components/profile_card_avatar.dart';
import 'package:threads_clone/dtos/back_button_enum.dart';
import 'package:threads_clone/pages/zoom_media_page.dart';
import 'package:threads_clone/styles/text_styles.dart';

import '../components/bottomSheets/edit_profile_bottom_sheet.dart';
import '../components/bottomSheets/new_thread_bottom_sheet.dart';
import '../utils/utils.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({
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
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool isThreadTab = true;
  late String username;

  @override
  void initState() {
    super.initState();
    username = widget.username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const BackIcon(backButtonEnum: BackButtonEnum.back),
                    Wrap(
                      spacing: 15,
                      children: [
                        InkWell(
                            child: const Icon(FontAwesomeIcons.instagram),
                            onTap: () => {}),
                        InkWell(
                            child: const Icon(CupertinoIcons.bell),
                            onTap: () => showCupertinoModalPopup<void>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      CupertinoAlertDialog(
                                    content: Text(
                                        'Follow $username to subscribe to notifications',
                                        style: boldTextStyle()),
                                    actions: <CupertinoDialogAction>[
                                      CupertinoDialogAction(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cancel'),
                                      ),
                                      CupertinoDialogAction(
                                        isDestructiveAction: false,
                                        isDefaultAction: true,
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Follow'),
                                      ),
                                    ],
                                  ),
                                )),
                        InkWell(
                            child: const Icon(CupertinoIcons.ellipsis_circle),
                            onTap: () => {}),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 15),
                        child: Text(
                          widget.fullName,
                          style: smallHeader(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 15),
                        child: Text(
                          widget.username,
                          style: usernameTextStyle(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 15),
                        child: Text(
                          widget.userBio,
                          style: usernameTextStyle(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 15),
                        child: Text(
                          "${widget.followerCount} followers",
                          style: smallText(),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () async => await showDialog(
                          useSafeArea: false,
                          context: context,
                          builder: (_) => ZoomMediaPage(
                              mediaPath: widget.profilePhotoPath!,
                              isMediaCircular: true)),
                      child: ProfileCardAvatar(
                        initials: "JD",
                        withoutAddButton: true,
                        size: const Size(70, 70),
                        profilePhotoPath: widget.profilePhotoPath,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CardButton(
                      buttonTitle: 'Follow',
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                      fixedWidth: screenWidth(context) / 2.4,
                      onPressed: () => editProfileBottomSheet(context),
                    ),
                    CardButton(
                        buttonTitle: 'Mention',
                        fixedWidth: screenWidth(context) / 2.4,
                        onPressed: () => newThreadBottomSheet(
                            context: context, isReply: false)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: paddingToTheSides,
                  top: 20,
                ),
                child: Text("Suggested for you",
                    style: boldTextStyle(customFontSize: 14)),
              ),
              SizedBox(
                  height: 150,
                  child: ListView(
                      scrollDirection: Axis.horizontal, children: [Text("a")])),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => {setState(() => isThreadTab = true)},
                      splashFactory: NoSplash.splashFactory,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: screenWidth(context) / 5),
                            child: Text(
                              "Threads",
                              style: titleTextStyle(
                                  color:
                                      isThreadTab ? Colors.black : Colors.grey),
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
                    ),
                    InkWell(
                      onTap: () => {setState(() => isThreadTab = false)},
                      splashFactory: NoSplash.splashFactory,
                      child: Column(
                        children: [
                          Text(
                            "Replies",
                            style: titleTextStyle(
                                color:
                                    isThreadTab ? Colors.grey : Colors.black),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
