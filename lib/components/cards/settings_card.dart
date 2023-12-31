import 'package:flutter/material.dart';
import 'package:threads_clone/utils/utils.dart';

import '../../dtos/settings_card_dto.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key, required this.settingsOptions});

  final SettingsCardDTO settingsOptions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 10),
      child: InkWell(
        onTap: settingsOptions.onClick != null
            ? () => settingsOptions.onClick!()
            : null,
        splashFactory: NoSplash.splashFactory,
        child: SizedBox(
          height: settingsOptions.extendedCard != null ? 100 : 50,
          width: screenWidth(context),
          // color: Colors.green,
          child: settingsOptions.trailingIcon != null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    settingsOptions.iconName != null
                        ? Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 20,
                            children: [
                              Icon(settingsOptions.iconName),
                              Text(
                                settingsOptions.cardTitle,
                                style: TextStyle(
                                    color: settingsOptions.textColor ??
                                        Colors.black),
                              )
                            ],
                          )
                        : Text(
                            settingsOptions.cardTitle,
                            style: TextStyle(
                                color:
                                    settingsOptions.textColor ?? Colors.black),
                          ),
                    settingsOptions.trailingIcon!
                  ],
                )
              : settingsOptions.iconName != null
                  ? Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 20,
                      children: [
                        Icon(settingsOptions.iconName),
                        Text(
                          settingsOptions.cardTitle,
                          style: TextStyle(
                              color: settingsOptions.textColor ?? Colors.black),
                        )
                      ],
                    )
                  : settingsOptions.extendedCard != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(settingsOptions.cardTitle,
                                style: TextStyle(
                                    color: settingsOptions.textColor ??
                                        Colors.black,
                                    fontWeight: FontWeight.bold)),
                            Text(settingsOptions.extendedCard!.cardSubtitle),
                          ],
                        )
                      : Text(
                          settingsOptions.cardTitle,
                          style: TextStyle(
                              color: settingsOptions.textColor ?? Colors.black,
                              fontWeight: settingsOptions.titleBold ?? false
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                        ),
        ),
      ),
    );
  }
}
