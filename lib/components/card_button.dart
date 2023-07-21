import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class CardButton extends StatelessWidget {
  const CardButton(
      {super.key,
      required this.buttonTitle,
      this.fixedWith = 90,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black});
  final String buttonTitle;
  final double fixedWith;
  final Color? backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          fixedSize: Size.fromWidth(fixedWith),
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
