import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class EntryLikeReplyDetails extends StatefulWidget {
  const EntryLikeReplyDetails(
      {Key? key, required this.replyCount, required this.likeCount})
      : super(key: key);
  final int replyCount;
  final int likeCount;

  @override
  State<EntryLikeReplyDetails> createState() => _EntryLikeReplyDetailsState();
}

class _EntryLikeReplyDetailsState extends State<EntryLikeReplyDetails> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: usernameTextPadding),
      child: Row(
        children: [
          Text(
            "${widget.replyCount} replies",
            style: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 5),
            child: Icon(
              CupertinoIcons.circle_fill,
              size: 3,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              "${widget.likeCount} likes",
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
