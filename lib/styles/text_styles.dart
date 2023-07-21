import 'package:flutter/material.dart';
import 'package:threads_clone/styles/color_styles.dart';

TextStyle? header() => const TextStyle(
    fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black);
TextStyle? smallText() =>
    TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: darkGrey);
TextStyle? followTextStyle({Color color = Colors.black}) =>
    TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: color);
