import 'package:flutter/material.dart';
import 'package:threads_clone/components/cards/new_thread_card.dart';
import 'package:threads_clone/utils/profile_data.dart';

import '../../styles/text_styles.dart';
import 'bottom_sheet.dart';

void newThreadBottomSheet(
        {required BuildContext context, required bool isReply}) =>
    bottomSheet(
        context: context,
        isDiscard: isReply,
        sheetName: isReply ? "Reply" : "New thread",
        rightIcon: false,
        bottomSheet: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Your followers can reply",
                style: smallText(),
              ),
              InkWell(
                  child: Text(
                    "Post",
                    style: boldTextStyle(color: Colors.blue),
                  ),
                  onTap: () => {})
            ],
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: NewThreadCard(profileDTO: profileData["mehmetustekk"]!),
          )
        ]);
