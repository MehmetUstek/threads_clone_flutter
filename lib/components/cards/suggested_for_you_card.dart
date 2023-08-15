import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/card_button.dart';
import 'package:threads_clone/styles/text_styles.dart';
import 'package:threads_clone/utils/utils.dart';

class SuggestedForYouCard extends StatefulWidget {
  const SuggestedForYouCard({Key? key}) : super(key: key);

  @override
  State<SuggestedForYouCard> createState() => _SuggestedForYouCardState();
}

class _SuggestedForYouCardState extends State<SuggestedForYouCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: CupertinoColors.secondarySystemFill,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      width: screenWidth(context) / 2.5,
      height: 200,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                  maxRadius: 45,
                  backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/53303474?s=400&u=1dc04b3eb1ac41e765f0f2dd1f9ce717b10122f0&v=4")),
              Text(
                "Mehmet Ustek",
                style: boldTextStyle(customFontSize: 14),
              ),
              Text(
                "mustek",
                style: smallText(customFontSize: 12),
              ),
              CardButton(
                buttonTitle: "Follow",
                onPressed: () => {},
                backgroundColor: CupertinoColors.black,
                textColor: CupertinoColors.white,
                fixedWidth: 110,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
