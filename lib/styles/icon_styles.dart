import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:threads_clone/bloc/mentions_bloc/mentions_cubit.dart';

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
void changeMentionOption(MentionsEnum? newValue, BuildContext context) {
  if (newValue != null) {
    context.read<MentionsCubit>().changeMentionOption(newValue);
  }
}

Widget mentionsRadio(
        {required MentionsEnum groupValue,
        required MentionsEnum radioValue,
        required BuildContext blocContext}) =>
    SizedBox(
      height: 35,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: CupertinoRadio<MentionsEnum>(
          fillColor: CupertinoColors.white,
          activeColor: CupertinoColors.black,
          value: radioValue,
          groupValue: groupValue,
          onChanged: (MentionsEnum? value) {
            changeMentionOption(value, blocContext);
          },
        ),
      ),
    );
