import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/profile_card_avatar.dart';
import 'package:threads_clone/utils/utils.dart';

import '../../dtos/profile_dto.dart';
import '../../styles/text_styles.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key, required this.profileDTO});

  final ProfileDTO profileDTO;

  @override
  State<ProfileCard> createState() => _EntryState();
}

class _EntryState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    ProfileDTO profileDTO = widget.profileDTO;
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
                    flex: 2,
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
                                userBio,
                                style: const TextStyle(
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: usernameTextPadding),
                            child: Text(
                              "$followerCount followers",
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      top: 5,
                      left: 10,
                    ),
                    child: SizedBox(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(),
                        onPressed: () => {},
                        child: Text(
                          "Follow",
                          style: followTextStyle(),
                        ),
                      ),
                    ),
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
