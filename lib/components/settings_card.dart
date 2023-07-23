import 'package:flutter/cupertino.dart';
import 'package:threads_clone/utils/utils.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard(
      {super.key, required this.iconName, required this.cardTitle});

  final IconData iconName;
  final String cardTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        height: 50,
        width: screenWidth(context),
        // color: Colors.green,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 20,
          children: [Icon(iconName), Text(cardTitle)],
        ),
      ),
    );
  }
}
