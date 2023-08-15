import 'package:flutter/cupertino.dart';

import '../../utils/utils.dart';

class EntryContent extends StatelessWidget {
  const EntryContent(
      {Key? key, required this.entryText, required this.withLeftRightPadding})
      : super(key: key);
  final String entryText;
  final bool withLeftRightPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: usernameTextPadding,
        left: withLeftRightPadding ? paddingToTheSides : 0,
        right: withLeftRightPadding ? paddingToTheSides : 0,
      ),
      child: SizedBox(
        width: entryMaxWidth(context),
        child: Text(
          entryText,
          style: const TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}
