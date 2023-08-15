import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/components/bottomSheets/options_sheet.dart';
import 'package:threads_clone/dtos/settings_card_dto.dart';

import '../../utils/utils.dart';
import '../bottomSheets/new_thread_bottom_sheet.dart';
import '../cards/settings_card.dart';
import '../share_sheet.dart';

class EntryActions extends StatefulWidget {
  const EntryActions(
      {Key? key,
      required this.onLike,
      required this.onUnlike,
      required this.username,
      required this.blocContext})
      : super(key: key);
  final String username;
  final Function onLike;
  final Function onUnlike;
  final BuildContext blocContext;

  @override
  State<EntryActions> createState() => _EntryActionsState();
}

class _EntryActionsState extends State<EntryActions> {
  bool isLiked = false;
  void onLiked() => setState(() {
        isLiked
            ? widget.onUnlike(widget.blocContext)
            : widget.onLike(widget.blocContext);
        isLiked = !isLiked;
      });
  late String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username = widget.username;
  }

  void onSend() => optionsSheet(context: context, children: [
        SettingsCard(
          settingsOptions: SettingsCardDTO(
              cardTitle: "Send on Instagram",
              trailingIcon: const Icon(CupertinoIcons.paperplane)),
        ),
        SettingsCard(
          settingsOptions: SettingsCardDTO(
              cardTitle: "Add to story",
              trailingIcon: const Icon(CupertinoIcons.add_circled)),
        ),
        SettingsCard(
          settingsOptions: SettingsCardDTO(
              cardTitle: "Post to feed",
              trailingIcon: const Icon(FontAwesomeIcons.instagram)),
        ),
        SettingsCard(
          settingsOptions: SettingsCardDTO(
            cardTitle: "Copy link",
            trailingIcon: const Icon(Icons.link),
            onClick: () async {
              popPage(context);
              const snackBar = SnackBar(
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(bottom: 65, left: 5, right: 5),
                elevation: 5,
                content: Wrap(
                  spacing: 12,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.checkmark_alt_circle,
                      color: Colors.white,
                    ),
                    Text('Link copied to clipboard'),
                  ],
                ),
              );

              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              await Clipboard.setData(
                  ClipboardData(text: "your text")); //TODO: Thread link
              // copied successfully
            },
          ),
        ),
        SettingsCard(
          settingsOptions: SettingsCardDTO(
              cardTitle: "Share via",
              trailingIcon: const Icon(CupertinoIcons.share),
              onClick: () {
                popPage(context);
                sharePressed("Post from $username");
              }),
        ),
      ]);
  void onRepost() => optionsSheet(context: context, small: true, children: [
        SettingsCard(
          settingsOptions: SettingsCardDTO(
              cardTitle: "Repost",
              trailingIcon: const Icon(CupertinoIcons.repeat),
              onClick: () async {
                popPage(context);
                SnackBar snackBar = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(
                      bottom: screenHeight(context) / 2.3,
                      left: screenWidth(context) / 2.8,
                      right: screenWidth(context) / 2.8),
                  elevation: 5,
                  content: Text(
                    'Reposted',
                    textAlign: TextAlign.center,
                  ),
                );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }),
        ),
        SettingsCard(
          settingsOptions: SettingsCardDTO(
              cardTitle: "Quote",
              trailingIcon: const Icon(CupertinoIcons.captions_bubble),
              onClick: () {
                popPage(context);
                newThreadBottomSheet(context: context, isReply: false);
              }),
        ),
      ]);
  void onReply() => newThreadBottomSheet(context: context, isReply: true);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: usernameTextPadding),
      child: Wrap(
        spacing: iconSpacing,
        children: [
          InkWell(
            onTap: onLiked,
            child: Icon(
              isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
              color: isLiked ? Colors.red : Colors.black,
              size: iconSize,
            ),
          ),
          InkWell(
            onTap: onReply,
            child: Icon(
              CupertinoIcons.bubble_right,
              size: iconSize,
            ),
          ),
          InkWell(
            onTap: onRepost,
            child: Icon(
              CupertinoIcons.repeat,
              size: iconSize,
            ),
          ),
          InkWell(
            onTap: onSend,
            child: Icon(
              CupertinoIcons.paperplane,
              size: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
