import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/card_button.dart';
import 'package:threads_clone/components/profile_card_avatar.dart';
import 'package:threads_clone/styles/color_styles.dart';
import 'package:threads_clone/utils/utils.dart';

import '../dtos/profile_dto.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({super.key, required this.profileDTO});
  final ProfileDTO profileDTO;

  @override
  Widget build(BuildContext context) {
    ProfileDTO profileDTO = this.profileDTO;
    final String username = profileDTO.username;
    final bool isVerifiedUser = profileDTO.isVerifiedUser;
    final String? profilePhotoPath = profileDTO.profilePhotoPath;
    final String userBio = profileDTO.userBio;
    final String initials = profileDTO.initials;
    final int followerCount = profileDTO.followerCount;

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
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: paddingToTheSides),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                username,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              if (isVerifiedUser)
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: blueTickLeftPadding),
                                  child: Icon(
                                    CupertinoIcons.check_mark_circled_solid,
                                    color: Colors.blue,
                                    size: 15,
                                  ),
                                ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: usernameTextPadding),
                            child: SizedBox(
                              width: bioMaxWidth(context),
                              child: Text(
                                "Follow request",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: darkGrey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 5,
                      top: 5,
                      left: 10,
                    ),
                    child: SizedBox(
                        child: CardButton(
                      buttonTitle: "Confirm",
                      onPressed: () => {},
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      top: 5,
                    ),
                    child: SizedBox(
                        child: CardButton(
                      buttonTitle: "Hide",
                      onPressed: () => {},
                    )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: Colors.grey.shade300,
                  width: screenWidth(context),
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
