import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/styles/text_styles.dart';

import '../components/settings_card.dart';
import '../styles/color_styles.dart';
import '../utils/settings_options.dart';
import '../utils/utils.dart';

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight(context) / 2.8,
                child: ListView.builder(
                  itemCount: settingOptions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SettingsCard(
                      settingsOptions: settingOptions[index],
                    );
                  },
                ),
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
          ),
        ),
      ),
    );
  }
}
