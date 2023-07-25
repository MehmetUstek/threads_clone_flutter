import 'package:flutter/cupertino.dart';
import 'package:threads_clone/pages/mentions_page.dart';
import 'package:threads_clone/styles/color_styles.dart';
import 'package:threads_clone/utils/utils.dart';

class ExtendedCard {
  final bool cardTitleBold;
  final String cardSubtitle;
  ExtendedCard({
    required this.cardTitleBold,
    required this.cardSubtitle,
  });
}

class SettingsCardDTO {
  final IconData? iconName;
  final String cardTitle;
  final Widget? trailingIcon;
  final Function? onClick;
  final ExtendedCard? extendedCard;

  SettingsCardDTO(
      {this.iconName,
      required this.cardTitle,
      this.trailingIcon,
      this.onClick,
      this.extendedCard});
}

const Icon rightChevronIcon = Icon(CupertinoIcons.right_chevron);
const Icon externalLinkIcon = Icon(CupertinoIcons.arrow_up_right_square);

enum MentionsEnum { everyone, you_follow, no_one }

//TODO: Change this.
Widget cupertinoSwitch = SizedBox(
  height: 30,
  child: FittedBox(
    fit: BoxFit.fitHeight,
    child: CupertinoSwitch(
      value: true,
      onChanged: (bool newValue) => {},
    ),
  ),
);
Widget cupertinoCombo(MentionsEnum? character) => SizedBox(
      height: 30,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: CupertinoRadio<MentionsEnum>(
          value: MentionsEnum.everyone,
          groupValue: character,
          onChanged: (MentionsEnum? value) {
            character = value;
          },
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

List<SettingsCardDTO> privacyOptions(BuildContext context) => [
      SettingsCardDTO(
          iconName: CupertinoIcons.lock,
          cardTitle: "Private Profile",
          trailingIcon: cupertinoSwitch),
      SettingsCardDTO(
          iconName: CupertinoIcons.at,
          cardTitle: "Mentions",
          onClick: () => pushToNewPage(context, MentionsPage()),
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

final List<SettingsCardDTO> mentionsOptions = [
  SettingsCardDTO(
    cardTitle: "Allow @mentions from",
    extendedCard: ExtendedCard(
        cardTitleBold: true,
        cardSubtitle:
            "Choose who can @mention you to link your profile in their threads, replies or bio. WHen people try to @mention you, they'll see you don't allow @mentions"),
  ),
  SettingsCardDTO(
      cardTitle: "Everyone",
      trailingIcon: Icon(CupertinoIcons.check_mark_circled_solid)),
  SettingsCardDTO(
      cardTitle: "Profiles you follow",
      trailingIcon: Icon(CupertinoIcons.circle)),
  SettingsCardDTO(
      cardTitle: "No one", trailingIcon: Icon(CupertinoIcons.circle)),
];
