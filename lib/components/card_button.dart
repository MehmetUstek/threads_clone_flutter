import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class CardButton extends StatelessWidget {
  const CardButton(
      {super.key,
      required this.buttonTitle,
      this.fixedWidth = 90,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black});
  final String buttonTitle;
  final double fixedWidth;
  final Color? backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          fixedSize: Size.fromWidth(fixedWidth),
          backgroundColor: backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () => {},
      child: Text(
        buttonTitle,
        style: followTextStyle(color: textColor),
      ),
    );
  }
}
