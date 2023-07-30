import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/text_styles.dart';
import '../../utils/utils.dart';

void bottomSheet({
  required BuildContext context,
  required List<Widget> children,
  required sheetName,
  required rightIcon,
}) =>
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        useSafeArea: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        constraints: BoxConstraints(
            minHeight: screenHeight(context) * 9.3 / 10,
            maxHeight: screenHeight(context) * 9.5 / 10),
        builder: (BuildContext context) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              // Try removing opacity to observe the lack of a blur effect and of sliding content.

              leading: Align(
                widthFactor: 1.0,
                alignment: Alignment.center,
                child: InkWell(
                    onTap: () => popPage(context),
                    child: Text("Cancel",
                        style: normalTextStyle(customFontSize: 14))),
              ),

              middle: Text(sheetName),
              trailing: rightIcon != null && rightIcon
                  ? Align(
                      widthFactor: 1.0,
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () => popPage(context), //TODO: Do something.
                        child: Text("Done",
                            style: boldTextStyle(
                                color: Colors.blue, customFontSize: 14)),
                      ),
                    )
                  : null,
            ),
            child: Column(
              children: [...children],
            ),
          );
        });
