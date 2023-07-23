import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/styles/color_styles.dart';
import 'package:threads_clone/styles/text_styles.dart';
import 'package:threads_clone/utils/utils.dart';

import '../components/settings_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 120,
        centerTitle: true,
        title: Text(
          "Settings",
          style: titleTextStyle(customFontSize: 20),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 5,
              children: [
                Icon(
                  CupertinoIcons.back,
                  color: Colors.black,
                ),
                Text(
                  "Back",
                  style: normalTextStyle(),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                SettingsCard(
                  iconName: CupertinoIcons.person_add,
                  cardTitle: "Follow and invite friends",
                ),
                SettingsCard(
                  iconName: CupertinoIcons.bell,
                  cardTitle: "Notifications",
                ),
                SettingsCard(
                  iconName: CupertinoIcons.lock,
                  cardTitle: "Privacy",
                ),
                SettingsCard(
                  iconName: CupertinoIcons.profile_circled,
                  cardTitle: "Account",
                ),
                SettingsCard(
                  iconName: CupertinoIcons.question_circle,
                  cardTitle: "Help",
                ),
                SettingsCard(
                  iconName: CupertinoIcons.info,
                  cardTitle: "About",
                ),
                Container(
                  color: lightGrey,
                  width: screenWidth(context),
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Log out",
                    style: TextStyle(color: warningColor),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
