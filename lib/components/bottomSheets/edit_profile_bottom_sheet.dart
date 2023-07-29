import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/styles/text_styles.dart';
import 'package:threads_clone/utils/utils.dart';

import 'bottom_sheet.dart';

Widget editProfileCard(BuildContext context, String title,
        {String? subtitle, IconData? icon}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          subtitle != null
              ? Text(
                  title,
                  style: boldTextStyle(customFontSize: 13),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: boldTextStyle(customFontSize: 13),
                    ),
                    CupertinoSwitch(
                        activeColor: Colors.black,
                        value: true,
                        onChanged: (bool newValue) => {}),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: icon != null && subtitle != null
                ? Wrap(
                    children: [
                      Icon(icon, size: 15),
                      Text(
                        subtitle,
                        style: normalTextStyle(customFontSize: 13),
                      ),
                    ],
                  )
                : subtitle != null
                    ? Text(
                        subtitle,
                        style: normalTextStyle(customFontSize: 13),
                      )
                    : null,
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: lineContainer(context, color: Colors.grey[400]),
            )
        ],
      ),
    );

void editProfileBottomSheet(BuildContext context) => bottomSheet(
        context: context,
        sheetName: "Edit Profile",
        rightIcon: true,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Center(
                child: Container(
              width: screenWidth(context) / 1.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey, width: 0.4)),
              child: Column(
                children: [
                  editProfileCard(context, "Name",
                      subtitle: "Mehmet Ustek (@mehmetustekk)",
                      icon: CupertinoIcons.lock),
                  editProfileCard(context, "Bio", subtitle: "Lorem ipsum bio"),
                  editProfileCard(context, "Link",
                      subtitle: "Add link", icon: CupertinoIcons.add),
                  editProfileCard(context, "Private profile"),
                ],
              ),
            )),
          )
        ]);
