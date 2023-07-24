import 'package:flutter/cupertino.dart';
import 'package:threads_clone/utils/utils.dart';

import '../utils/settings_options.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key, required this.settingsOptions});

  final SettingsCardDTO settingsOptions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10),
      child: Container(
        height: 50,
        width: screenWidth(context),
        // color: Colors.green,
        child: settingsOptions.trailingIcon != null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 20,
                    children: [
                      Icon(settingsOptions.iconName),
                      Text(settingsOptions.cardTitle)
                    ],
                  ),
                  settingsOptions.trailingIcon!
                ],
              )
            : Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 20,
                children: [
                  Icon(settingsOptions.iconName),
                  Text(settingsOptions.cardTitle)
                ],
              ),
      ),
    );
  }
}
