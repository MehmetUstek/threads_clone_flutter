import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';
import '../../utils/utils.dart';

void bottomSheet(
        {required BuildContext context,
        required List<Widget> children,
        required sheetName}) =>
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        useSafeArea: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        constraints: BoxConstraints(
            minHeight: screenHeight(context) * 9.3 / 10,
            maxHeight: screenHeight(context) * 9.5 / 10),
        builder: (BuildContext context) {
          return Column(
            children: [
              Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () => popPage(context),
                            child: Text("Cancel",
                                style: normalTextStyle(customFontSize: 14))),
                        Text(sheetName,
                            style: titleTextStyle(customFontSize: 17)),
                        InkWell(
                          child: Text("Done",
                              style: boldTextStyle(
                                  color: Colors.blue, customFontSize: 14)),
                        )
                      ],
                    ),
                  )),
              ...children
            ],
          );
        });
