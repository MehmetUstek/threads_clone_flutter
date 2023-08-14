import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/components/bottomSheets/options_sheet.dart';
import 'package:threads_clone/dtos/settings_card_dto.dart';

import '../../utils/utils.dart';
import '../cards/settings_card.dart';

class EntryActions extends StatefulWidget {
  const EntryActions({Key? key, required this.onLike, required this.onUnlike})
      : super(key: key);
  final Function onLike;
  final Function onUnlike;

  @override
  State<EntryActions> createState() => _EntryActionsState();
}

class _EntryActionsState extends State<EntryActions> {
  bool isLiked = false;
  void onLiked() => setState(() {
        isLiked ? widget.onUnlike() : widget.onLike();
        isLiked = !isLiked;
      });
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
              trailingIcon: const Icon(CupertinoIcons.share)),
        ),
      ]);
  void onRepost() => optionsSheet(context: context, small: true, children: [
        SettingsCard(
          settingsOptions: SettingsCardDTO(
              cardTitle: "Repost",
              trailingIcon: const Icon(CupertinoIcons.repeat)),
        ),
        SettingsCard(
          settingsOptions: SettingsCardDTO(
              cardTitle: "Quote",
              trailingIcon: const Icon(CupertinoIcons.captions_bubble)),
        ),
      ]);
  void onReply() => UnimplementedError();

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
