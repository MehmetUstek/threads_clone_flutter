import 'package:flutter/cupertino.dart';
import 'package:threads_clone/styles/color_styles.dart';

class SettingsCardDTO {
  final IconData iconName;
  final String cardTitle;
  final Widget? trailingIcon;
  final Function? onClick;

  SettingsCardDTO(
      {required this.iconName,
      required this.cardTitle,
      this.trailingIcon,
      this.onClick});
}

const Icon rightChevronIcon = Icon(CupertinoIcons.right_chevron);
const Icon externalLinkIcon = Icon(CupertinoIcons.arrow_up_right_square);
//TODO: Change this.
Widget cupertinoSwitch = Container(
  height: 30,
  child: FittedBox(
    fit: BoxFit.fitHeight,
    child: CupertinoSwitch(
      value: true,
      onChanged: (bool newValue) => {},
    ),
  ),
);

final List<SettingsCardDTO> settingOptions = [
  SettingsCardDTO(
      iconName: CupertinoIcons.person_add,
      cardTitle: "Follow and invite friends"),
  SettingsCardDTO(iconName: CupertinoIcons.bell, cardTitle: "Notifications"),
  SettingsCardDTO(
    iconName: CupertinoIcons.lock,
    cardTitle: "Privacy",
  ),
  SettingsCardDTO(
      iconName: CupertinoIcons.profile_circled, cardTitle: "Account"),
  SettingsCardDTO(iconName: CupertinoIcons.question_circle, cardTitle: "Help"),
  SettingsCardDTO(iconName: CupertinoIcons.info, cardTitle: "About"),
];

final List<SettingsCardDTO> privacyOptions = [
  SettingsCardDTO(
      iconName: CupertinoIcons.lock,
      cardTitle: "Private Profile",
      trailingIcon: cupertinoSwitch),
  SettingsCardDTO(
      iconName: CupertinoIcons.at,
      cardTitle: "Mentions",
      trailingIcon: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 5,
        children: [
          Text("Everyone", style: TextStyle(color: darkGrey, fontSize: 13)),
          rightChevronIcon
        ],
      )),
  SettingsCardDTO(
      iconName: CupertinoIcons.bell_slash,
      cardTitle: "Muted",
      trailingIcon: rightChevronIcon),
  SettingsCardDTO(
      iconName: CupertinoIcons.eye_slash,
      cardTitle: "Hidden Words",
      trailingIcon: rightChevronIcon),
  SettingsCardDTO(
      iconName: CupertinoIcons.person_2,
      cardTitle: "Profiles you follow",
      trailingIcon: rightChevronIcon),
  SettingsCardDTO(
      iconName: CupertinoIcons.xmark_circle,
      cardTitle: "Blocked profiles",
      trailingIcon: externalLinkIcon),
  SettingsCardDTO(
      iconName: CupertinoIcons.heart_slash,
      cardTitle: "Hide likes",
      trailingIcon: externalLinkIcon),
];
