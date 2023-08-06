import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle? header() => const TextStyle(
    fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
TextStyle? smallHeader() => const TextStyle(
    fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black);
TextStyle? usernameTextStyle() => const TextStyle(
    fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black);
TextStyle? titleTextStyle(
        {Color color = Colors.black, double customFontSize = 15}) =>
    TextStyle(
        fontSize: customFontSize, fontWeight: FontWeight.bold, color: color);
TextStyle? smallText(
        {double customFontSize = 15,
        Color color = CupertinoColors.inactiveGray}) =>
    TextStyle(
        fontSize: customFontSize, fontWeight: FontWeight.normal, color: color);
TextStyle? normalTextStyle(
        {double customFontSize = 17, Color color = Colors.black}) =>
    TextStyle(
        fontSize: customFontSize, fontWeight: FontWeight.normal, color: color);
TextStyle? boldTextStyle(
        {double customFontSize = 17, Color color = Colors.black}) =>
    TextStyle(
        fontSize: customFontSize, fontWeight: FontWeight.bold, color: color);
TextStyle? followTextStyle({Color color = Colors.black}) =>
    TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color);
