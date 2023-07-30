import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/scaffold_with_name.dart';

import '../components/settings_card.dart';
import '../styles/color_styles.dart';
import '../utils/settings_options.dart';
import '../utils/utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithName(
      pageName: "Settings",
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight(context) / 2.8,
              child: ListView.builder(
                itemCount: settingOptions(context).length,
                itemBuilder: (BuildContext context, int index) {
                  return SettingsCard(
                    settingsOptions: settingOptions(context)[index],
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
    );
  }
}
