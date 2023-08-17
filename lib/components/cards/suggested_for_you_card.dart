import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/card_button.dart';
import 'package:threads_clone/styles/text_styles.dart';
import 'package:threads_clone/utils/utils.dart';

class SuggestedForYouCard extends StatefulWidget {
  const SuggestedForYouCard(
      {Key? key,
      required this.username,
      required this.fullName,
      required this.profilePhotoPath,
      required this.initials})
      : super(key: key);
  final String username;
  final String fullName;
  final String? profilePhotoPath;
  final String initials;

  @override
  State<SuggestedForYouCard> createState() => _SuggestedForYouCardState();
}

class _SuggestedForYouCardState extends State<SuggestedForYouCard> {
  late String username;
  late String fullName;
  late String initials;
  late String? profilePhotoPath;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username = widget.username;
    fullName = widget.fullName;
    profilePhotoPath = widget.profilePhotoPath;
    initials = widget.initials;
  }

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
              profilePhotoPath != null
                  ? CircleAvatar(
                      maxRadius: 45,
                      backgroundImage: NetworkImage(profilePhotoPath!))
                  : CircleAvatar(
                      maxRadius: 45,
                      backgroundColor: Colors.orange.shade800,
                      child: Text(initials,
                          style: normalTextStyle(color: Colors.white)),
                    ),
              Text(
                fullName,
                style: boldTextStyle(customFontSize: 14),
              ),
              Text(
                username,
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
