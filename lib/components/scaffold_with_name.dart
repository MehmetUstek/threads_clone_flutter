import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/text_styles.dart';
import '../utils/utils.dart';

class ScaffoldWithName extends StatelessWidget {
  const ScaffoldWithName({Key? key, required this.body, required this.pageName})
      : super(key: key);
  final Widget body;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          // Try removing opacity to observe the lack of a blur effect and of sliding content.

          leading: Align(
            widthFactor: 1.0,
            alignment: Alignment.center,
            child: Material(
              child: InkWell(
                  onTap: () => popPage(context),
                  child: Text("Cancel",
                      style: normalTextStyle(customFontSize: 14))),
            ),
          ),

          middle: Align(
              widthFactor: 1.0,
              alignment: Alignment.center,
              child: Text(pageName)),
          // trailing: Align(
          //   widthFactor: 1.0,
          //   alignment: Alignment.center,
          //   child: Material(
          //     child: InkWell(
          //       onTap: () => popPage(context), //TODO: Do something.
          //       child: Text("Done",
          //           style:
          //               boldTextStyle(color: Colors.blue, customFontSize: 14)),
          //     ),
          //   ),
          // ),
        ),
        backgroundColor: Colors.white,
        child: SafeArea(child: Material(child: body)));
  }
}
