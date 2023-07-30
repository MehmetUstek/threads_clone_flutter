import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/options_page.dart';

import '../dtos/settings_card_dto.dart';

class ReusableOptionsPage extends StatelessWidget {
  const ReusableOptionsPage(
      {super.key, required this.pageName, required this.optionsData});

  final String pageName;
  final List<SettingsCardDTO> optionsData;
  @override
  Widget build(BuildContext context) {
    return OptionsPage(
      pageName: pageName,
      optionsData: optionsData,
    );
  }
}
