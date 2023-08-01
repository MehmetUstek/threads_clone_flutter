import 'dart:math';

import 'package:flutter/material.dart';

import '../styles/color_styles.dart';

const double iconWidth = 30;
const double paddingToTheSides = 10;
const double textPadding = paddingToTheSides + iconWidth + 15;
const double usernameTextPadding = 8;
const double photoPadding = 12;
const double blueTickLeftPadding = 3;
const double iconSize = 21;
const double iconSpacing = 10;

double screenWidth(context) => MediaQuery.of(context).size.width;
double screenHeight(context) => MediaQuery.of(context).size.height;

double entryMaxWidth(context) =>
    screenWidth(context) - textPadding - paddingToTheSides * 2;

double bioMaxWidth(context) => 200;

double photoMaxWidth(context) =>
    screenWidth(context) - textPadding - paddingToTheSides * 2;

int randomNumberGenerator() {
  Random random = Random();
  return random.nextInt(500);
}

List<String> activityFiltersData = ["All", "Requests", "Replies", "Mentions"];

enum ActivityFiltersEnum { All, Requests, Replies, Mentions }

void emptyFunction() => {};
void pushToNewPage(BuildContext context, Widget pushRoute) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pushRoute),
    );

void popPage(BuildContext context) => Navigator.pop(
      context,
    );

Widget lineContainer(BuildContext context, {double? width, Color? color}) =>
    Container(
      color: color ?? lightGrey,
      width: width ?? screenWidth(context),
      height: 1,
    );
