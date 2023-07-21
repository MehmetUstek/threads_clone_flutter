import 'dart:math';

import 'package:flutter/cupertino.dart';

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

double bioMaxWidth(context) => 200;

double photoMaxWidth(context) =>
    MediaQuery.of(context).size.width - textPadding - 10;

int randomNumberGenerator() {
  Random random = Random();
  return random.nextInt(500);
}

List<String> activityFiltersData = ["All", "Requests", "Replies", "Mentions"];
