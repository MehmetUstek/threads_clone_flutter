import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class EntryActions extends StatefulWidget {
  const EntryActions({Key? key}) : super(key: key);

  @override
  State<EntryActions> createState() => _EntryActionsState();
}

class _EntryActionsState extends State<EntryActions> {
  bool isLiked = false;
  void onLiked() => setState(() {
        isLiked = !isLiked;
      });
  void onSend() => UnimplementedError();
  void onReply() => UnimplementedError();
  void onRepost() => UnimplementedError();

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
