import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/profile_card_avatar.dart';
import 'package:threads_clone/styles/text_styles.dart';
import 'package:threads_clone/utils/utils.dart';

import '../../dtos/profile_dto.dart';

class NewThreadCard extends StatefulWidget {
  const NewThreadCard({super.key, required this.profileDTO});
  final ProfileDTO profileDTO;

  @override
  State<NewThreadCard> createState() => _NewThreadCardState();
}

class _NewThreadCardState extends State<NewThreadCard> {
  @override
  Widget build(BuildContext context) {
    ProfileDTO profileDTO = this.widget.profileDTO;
    final String username = profileDTO.username;
    final bool isVerifiedUser = profileDTO.isVerifiedUser;
    final String? profilePhotoPath = profileDTO.profilePhotoPath;
    final String initials = profileDTO.initials;
    TextEditingController textEditingController =
        TextEditingController(text: "");

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        child: SizedBox(
          width: screenWidth(context),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileCardAvatar(
                    initials: initials,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: paddingToTheSides),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          if (isVerifiedUser)
                            const Padding(
                              padding:
                                  EdgeInsets.only(left: blueTickLeftPadding),
                              child: Icon(
                                CupertinoIcons.check_mark_circled_solid,
                                color: Colors.blue,
                                size: 15,
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: TextField(
                              style: TextStyle(fontSize: 15, height: 1.5),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                  hintText: 'Start a thread',
                                  hintStyle: smallText()),
                              maxLines: null,
                              controller: textEditingController,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                                onPressed: () =>
                                    {}, //TODO: Add image_picker. Leave this at the end.
                                icon: Icon(
                                  CupertinoIcons.paperclip,
                                  size: 20,
                                  color: CupertinoColors.inactiveGray,
                                ),
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: InkWell(
                                  onTap: () => {},
                                  child: Text(
                                    "Add to thread",
                                    style: smallText(
                                        color: CupertinoColors.inactiveGray
                                            .withOpacity(0.6)),
                                  ))),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
