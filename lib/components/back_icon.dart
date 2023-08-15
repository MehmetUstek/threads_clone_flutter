import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dtos/back_button_enum.dart';
import '../styles/text_styles.dart';
import '../utils/utils.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({Key? key, required this.backButtonEnum, this.isDiscard})
      : super(key: key);
  final BackButtonEnum backButtonEnum;
  final bool? isDiscard;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => isDiscard != null
            ? isDiscard!
                ? showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Discard reply?'),
                      actions: <CupertinoDialogAction>[
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () {
                            popPage(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        CupertinoDialogAction(
                          isDestructiveAction: true,
                          onPressed: () {
                            popPage(context);
                            popPage(context);
                          },
                          child: const Text('Discard'),
                        ),
                      ],
                    ),
                  )
                : popPage(context)
            : popPage(context),
        child: backButtonEnum == BackButtonEnum.cancel
            ? Text("Cancel", style: normalTextStyle(customFontSize: 14))
            : Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 2,
                children: [
                  const Icon(
                    CupertinoIcons.left_chevron,
                    size: 18,
                    color: CupertinoColors.black,
                  ),
                  Text("Back", style: normalTextStyle(customFontSize: 14))
                ],
              ));
  }
}
