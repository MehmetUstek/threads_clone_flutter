import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/options_page.dart';

import '../utils/settings_options.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OptionsPage(
      pageName: "Privacy",
      optionsData: privacyOptions(context),
    );
  }
}
