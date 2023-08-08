import 'package:flutter/material.dart';
import 'package:threads_clone/components/scaffold_with_name.dart';
import 'package:threads_clone/dtos/back_button_enum.dart';

import '../../utils/utils.dart';

void bottomSheet({
  required BuildContext context,
  required List<Widget> children,
  required sheetName,
  required rightIcon,
  bottomSheet,
}) =>
    showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.white,
        useSafeArea: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(8),
          ),
        ),
        clipBehavior: Clip.antiAlias,
        constraints: BoxConstraints(
            minHeight: screenHeight(context) * 9.3 / 10,
            maxHeight: screenHeight(context) * 9.5 / 10),
        builder: (BuildContext context) {
          return ScaffoldWithName(
            backbuttonEnum: BackButtonEnum.cancel,
            bottomSheet: bottomSheet,
            pageName: "New Thread",
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [...children],
            ),
          );
        });
