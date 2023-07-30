import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/scaffold_with_name.dart';

import '../components/settings_card.dart';
import '../dtos/settings_card_dto.dart';
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
        padding: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            SizedBox(
              height: screenHeight(context),
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
