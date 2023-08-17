import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/components/back_icon.dart';
import 'package:threads_clone/components/card_button.dart';
import 'package:threads_clone/components/cards/suggested_for_you_card.dart';
import 'package:threads_clone/components/profile_card_avatar.dart';
import 'package:threads_clone/dtos/back_button_enum.dart';
import 'package:threads_clone/pages/zoom_media_page.dart';
import 'package:threads_clone/styles/text_styles.dart';
import 'package:threads_clone/utils/profile_data.dart';

import '../components/bottomSheets/edit_profile_bottom_sheet.dart';
import '../components/bottomSheets/new_thread_bottom_sheet.dart';
import '../components/bottomSheets/options_sheet.dart';
import '../components/cards/settings_card.dart';
import '../dtos/profile_dto.dart';
import '../dtos/settings_card_dto.dart';
import '../utils/utils.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({
    super.key,
    required this.username,
  });
  final String username;

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  bool isThreadTab = true;
  late ProfileDTO profile;
  late String username;
  late String userBio;

  @override
  void initState() {
    super.initState();
    username = widget.username;
    profile = profileData[username]!;
    userBio = profile.userBio;
  }

  void onProfileSettingsClicked() =>
      optionsSheet(context: context, small: false, children: [
        SettingsCard(
          settingsOptions: SettingsCardDTO(
            cardTitle: "Mute",
            titleBold: true,
          ),
        ),
        SettingsCard(
          settingsOptions: SettingsCardDTO(
            cardTitle: "Restrict",
            titleBold: true,
          ),
        ),
        SettingsCard(
          settingsOptions: SettingsCardDTO(
            cardTitle: "Block",
            textColor: CupertinoColors.destructiveRed,
            titleBold: true,
          ),
        ),
        SettingsCard(
          settingsOptions: SettingsCardDTO(
            cardTitle: "Report",
            textColor: CupertinoColors.destructiveRed,
            titleBold: true,
          ),
        ),
      ]);

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
                            onTap: onProfileSettingsClicked),
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
                          profile.fullName,
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
                          profile.userBio,
                          style: usernameTextStyle(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 15),
                        child: Text(
                          "${profile.followerCount} followers",
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
                              mediaPath: profile.profilePhotoPath!,
                              isMediaCircular: true)),
                      child: ProfileCardAvatar(
                        initials: profile.initials,
                        withoutAddButton: true,
                        size: const Size(70, 70),
                        profilePhotoPath: profile.profilePhotoPath,
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
                    left: paddingToTheSides, top: 20, bottom: 10),
                child: Text("Suggested for you",
                    style: boldTextStyle(customFontSize: 14)),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: profileData.length,
                  itemBuilder: (context, index) => SuggestedForYouCard(
                    profilePhotoPath:
                        profileData.values.elementAt(index).profilePhotoPath,
                    initials: profileData.values.elementAt(index).initials,
                    fullName: profileData.values.elementAt(index).fullName,
                    username: profileData.values.elementAt(index).username,
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 10,
                  ),
                  // itemBuilder: [
                  //   SuggestedForYouCard(),
                  //   SuggestedForYouCard(),
                  // ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
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
