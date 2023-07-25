import 'package:flutter/material.dart';
import 'package:threads_clone/styles/text_styles.dart';
import 'package:threads_clone/utils/utils.dart';

import 'bottom_sheet.dart';

void editProfileBottomSheet(BuildContext context) =>
    bottomSheet(context: context, sheetName: "Edit Profile", children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Center(
            child: Container(
          height: screenHeight(context) / 3.5,
          width: screenWidth(context) / 1.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 0.4)),
          child: Text(
            "Name",
            style: boldTextStyle(customFontSize: 13),
          ),
        )),
      )
    ]);
