import 'package:flutter/material.dart';
import 'package:threads_clone/dtos/profile_dto.dart';

import '../activity_card.dart';
import 'bottom_sheet.dart';

void newThreadBottomSheet(BuildContext context) => bottomSheet(
        context: context,
        sheetName: "New thread",
        rightIcon: false,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ActivityCard(
              profileDTO: ProfileDTO(
                  followerCount: 10,
                  username: "a",
                  userBio: "a",
                  firstName: 'Jane',
                  lastName: "Doe",
                  initials: "JD"),
            ),
          )
        ]);
