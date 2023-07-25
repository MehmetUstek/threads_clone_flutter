import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/scaffold_with_name.dart';

import '../components/settings_card.dart';
import '../utils/settings_options.dart';
import '../utils/utils.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage(
      {Key? key, required this.optionsData, required this.pageName})
      : super(key: key);
  final List<SettingsCardDTO> optionsData;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithName(
      pageName: pageName,
      body: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight(context) / 2,
              child: ListView.builder(
                itemCount: optionsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return SettingsCard(
                    settingsOptions: optionsData[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
