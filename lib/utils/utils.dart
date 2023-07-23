import 'dart:math';

import 'package:flutter/material.dart';

const double iconWidth = 30;
const double paddingToTheSides = 10;
const double textPadding = paddingToTheSides + iconWidth + 15;
const double usernameTextPadding = 8;
const double photoPadding = 12;
const double blueTickLeftPadding = 3;
const double iconSize = 21;
const double iconSpacing = 10;

double screenWidth(context) => MediaQuery.of(context).size.width;

double entryMaxWidth(context) => screenWidth(context) - textPadding;

double bioMaxWidth(context) => 200;

double photoMaxWidth(context) => screenWidth(context) - textPadding - 10;

int randomNumberGenerator() {
  Random random = Random();
  return random.nextInt(500);
}

List<String> activityFiltersData = ["All", "Requests", "Replies", "Mentions"];

void emptyFunction() => {};
void pushToNewPage(BuildContext context, Widget pushRoute) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pushRoute),
    );
