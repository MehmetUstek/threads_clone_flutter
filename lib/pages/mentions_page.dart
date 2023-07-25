import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/options_page.dart';

import '../utils/settings_options.dart';

class MentionsPage extends StatelessWidget {
  const MentionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OptionsPage(
      pageName: "Mentions",
      optionsData: mentionsOptions,
    );
  }
}
