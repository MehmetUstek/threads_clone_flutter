import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class ScaffoldWithName extends StatelessWidget {
  const ScaffoldWithName({Key? key, required this.body, required this.pageName})
      : super(key: key);
  final Widget body;
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 120,
          centerTitle: true,
          title: Text(
            pageName,
            style: titleTextStyle(customFontSize: 20),
          ),
          leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 5,
                children: [
                  const Icon(
                    CupertinoIcons.back,
                    color: Colors.black,
                  ),
                  Text(
                    "Back",
                    style: normalTextStyle(),
                  )
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(child: body));
  }
}
