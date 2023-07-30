import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/pages/reusable_options_page.dart';
import 'package:threads_clone/styles/color_styles.dart';
import 'package:threads_clone/utils/utils.dart';

import '../dtos/extended_card_dto.dart';
import '../dtos/settings_card_dto.dart';
import '../styles/icon_styles.dart';

List<SettingsCardDTO> settingOptions(BuildContext context) => [
      SettingsCardDTO(
        iconName: CupertinoIcons.person_add,
        cardTitle: "Follow and invite friends",
        onClick: () => pushToNewPage(
            context,
            ReusableOptionsPage(
              pageName: "Mentions",
              optionsData: followInviteFriendsOptions,
            )),
      ),
      SettingsCardDTO(
        iconName: CupertinoIcons.bell,
        cardTitle: "Notifications",
        onClick: () => pushToNewPage(
            context,
            ReusableOptionsPage(
              pageName: "Notifications",
              optionsData: notificationsOptions,
            )),
      ),
      SettingsCardDTO(
        iconName: CupertinoIcons.lock,
        cardTitle: "Privacy",
        onClick: () => pushToNewPage(
            context,
            ReusableOptionsPage(
              pageName: "Privacy",
              optionsData: privacyOptions(context),
            )),
      ),
      SettingsCardDTO(
        iconName: CupertinoIcons.profile_circled,
        cardTitle: "Account",
        onClick: () => pushToNewPage(
            context,
            ReusableOptionsPage(
              pageName: "Account",
              optionsData: accountOptions,
            )),
      ),
      SettingsCardDTO(
        iconName: CupertinoIcons.question_circle,
        cardTitle: "Help",
        onClick: () => pushToNewPage(
            context,
            ReusableOptionsPage(
              pageName: "Help",
              optionsData: helpOptions,
            )),
      ),
      SettingsCardDTO(
        iconName: CupertinoIcons.info,
        cardTitle: "About",
        onClick: () => pushToNewPage(
            context,
            ReusableOptionsPage(
              pageName: "About",
              optionsData: aboutOptions,
            )),
      ),
    ];

List<SettingsCardDTO> privacyOptions(BuildContext context) => [
      SettingsCardDTO(
          iconName: CupertinoIcons.lock,
          cardTitle: "Private Profile",
          trailingIcon: cupertinoSwitch),
      SettingsCardDTO(
          iconName: CupertinoIcons.at,
          cardTitle: "Mentions",
          onClick: () => pushToNewPage(
              context,
              ReusableOptionsPage(
                pageName: "Mentions",
                optionsData: mentionsOptions,
              )),
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

final List<SettingsCardDTO> followInviteFriendsOptions = [
  SettingsCardDTO(
      cardTitle: "Follow accounts from Instagram",
      iconName: FontAwesomeIcons.instagram),
  SettingsCardDTO(
      cardTitle: "Invite friends by WhatsApp",
      iconName: FontAwesomeIcons.whatsapp),
  SettingsCardDTO(
      cardTitle: "Invite friends by SMS", iconName: FontAwesomeIcons.message),
  SettingsCardDTO(
      cardTitle: "Invite friends by email", iconName: CupertinoIcons.mail),
  SettingsCardDTO(
      cardTitle: "Invite friends by...", iconName: CupertinoIcons.share),
];

final List<SettingsCardDTO> notificationsOptions = [
  SettingsCardDTO(cardTitle: "Push notifications", titleBold: true),
  SettingsCardDTO(
    cardTitle: "Pause all",
  ),
  SettingsCardDTO(
    cardTitle: "Threads and replies",
    trailingIcon: rightChevronIcon,
  ),
  SettingsCardDTO(
    cardTitle: "Following and followers",
    trailingIcon: rightChevronIcon,
  ),
];
final List<SettingsCardDTO> accountOptions = [
  SettingsCardDTO(
    cardTitle: "Take a break",
    trailingIcon: rightChevronIcon,
  ),
  SettingsCardDTO(
    cardTitle: "Deactivate profile",
    trailingIcon: rightChevronIcon,
  ),
  SettingsCardDTO(
      cardTitle: "Other account settings",
      // trailingIcon: externalLinkIcon,
      extendedCard: ExtendedCard(
          cardTitleBold: true,
          cardSubtitle:
              "Some settings, like sensitive content controls, apply to both Threads and Instagram and can be managed on Instagram")),
  SettingsCardDTO(
    cardTitle: "Personal Information",
    trailingIcon: externalLinkIcon,
  ),
  SettingsCardDTO(
    cardTitle: "Supervision",
    trailingIcon: externalLinkIcon,
  ),
  SettingsCardDTO(
    cardTitle: "Security",
    trailingIcon: externalLinkIcon,
  ),
  SettingsCardDTO(
    cardTitle: "Language",
    trailingIcon: externalLinkIcon,
  ),
  SettingsCardDTO(
    cardTitle: "Account Status",
    trailingIcon: externalLinkIcon,
  ),
  SettingsCardDTO(
    cardTitle: "Download your information",
    trailingIcon: externalLinkIcon,
  ),
  SettingsCardDTO(
    cardTitle: "Transfer your information",
    trailingIcon: externalLinkIcon,
  ),
];

final List<SettingsCardDTO> helpOptions = [
  SettingsCardDTO(
    cardTitle: "Report a problem",
    trailingIcon: rightChevronIcon,
  ),
  SettingsCardDTO(
    cardTitle: "Help Center",
    trailingIcon: rightChevronIcon,
  ),
  SettingsCardDTO(
    cardTitle: "Privacy and security help",
    trailingIcon: rightChevronIcon,
  ),
  SettingsCardDTO(
    cardTitle: "Support requests",
    trailingIcon: rightChevronIcon,
  ),
];

final List<SettingsCardDTO> aboutOptions = [
  SettingsCardDTO(
    cardTitle: "Privacy Policy",
    trailingIcon: rightChevronIcon,
  ),
  SettingsCardDTO(
    cardTitle: "Terms of Use",
    trailingIcon: rightChevronIcon,
  ),
  SettingsCardDTO(
    cardTitle: "Third Party Notices",
    trailingIcon: rightChevronIcon,
  ),
];
