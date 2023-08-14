import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/back_icon.dart';

import '../dtos/back_button_enum.dart';

class ScaffoldWithName extends StatelessWidget {
  const ScaffoldWithName(
      {Key? key,
      required this.body,
      required this.pageName,
      required this.backbuttonEnum,
      this.bottomSheet})
      : super(key: key);
  final Widget body;
  final String pageName;
  final BackButtonEnum backbuttonEnum;
  final Widget? bottomSheet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: bottomSheet,
        appBar: CupertinoNavigationBar(
          // Try removing opacity to observe the lack of a blur effect and of sliding content.

          leading: Align(
            widthFactor: 1.0,
            alignment: Alignment.center,
            child: Material(
              child: BackIcon(backButtonEnum: backbuttonEnum),
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
        body: SafeArea(child: Material(child: body)));
  }
}
