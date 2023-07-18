import 'package:flutter/cupertino.dart';
import 'dart:math';

const double iconWidth = 30;
const double paddingToTheSides = 10;
const double textPadding = paddingToTheSides + iconWidth + 15;
const double usernameTextPadding = 8;
const double photoPadding = 12;
const double blueTickLeftPadding = 3;
const double iconSize = 21;
const double iconSpacing = 10;
double entryMaxWidth(context) =>
    MediaQuery.of(context).size.width - textPadding;

double photoMaxWidth(context) =>
    MediaQuery.of(context).size.width - textPadding - 10;

int randomNumberGenerator() {
  Random random = new Random();
  return random.nextInt(500);
}
