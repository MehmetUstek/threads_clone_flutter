import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../dtos/mentions_enum.dart';

const Icon rightChevronIcon = Icon(CupertinoIcons.right_chevron);
const Icon externalLinkIcon = Icon(
  FontAwesomeIcons.upRightFromSquare,
  size: 15,
  color: CupertinoColors.inactiveGray,
);

//TODO: Change this.
Widget cupertinoSwitch = SizedBox(
  height: 30,
  child: FittedBox(
    fit: BoxFit.fitHeight,
    child: CupertinoSwitch(
      value: true,
      onChanged: (bool newValue) => {},
    ),
  ),
);
Widget cupertinoCombo(MentionsEnum? character) => SizedBox(
      height: 30,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: CupertinoRadio<MentionsEnum>(
          value: MentionsEnum.everyone,
          groupValue: character,
          onChanged: (MentionsEnum? value) {
            character = value;
          },
        ),
      ),
    );
