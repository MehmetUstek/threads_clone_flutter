import 'package:flutter/material.dart';

import '../../utils/utils.dart';

void optionsSheet({
  required BuildContext context,
  required List<Widget> children,
  bool? small,
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
            minHeight: small != null && small
                ? screenHeight(context) * 2 / 10
                : screenHeight(context) * 3 / 10,
            maxHeight: small != null && small
                ? screenHeight(context) * 2.5 / 10
                : screenHeight(context) * 4.5 / 10),
        builder: (BuildContext context) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Container(
                      // color: Colors.black,
                      height: 5,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(20),
                        // border:
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                  ),
                  ...children
                ],
              ),
            ),
          );
        });
