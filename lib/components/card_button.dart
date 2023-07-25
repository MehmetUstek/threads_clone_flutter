import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class CardButton extends StatelessWidget {
  const CardButton(
      {super.key,
      required this.buttonTitle,
      this.fixedWidth = 90,
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      required this.onPressed,
      this.isActive});
  final String buttonTitle;
  final double fixedWidth;
  final Color? backgroundColor;
  final Color textColor;
  final Function() onPressed;
  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          fixedSize: Size.fromWidth(fixedWidth),
          backgroundColor: isActive == null
              ? backgroundColor
              : isActive!
                  ? Colors.black
                  : Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: onPressed,
      child: Text(
        buttonTitle,
        style: followTextStyle(
            color: isActive == null
                ? textColor
                : isActive!
                    ? Colors.white
                    : Colors.black),
      ),
    );
  }
}
