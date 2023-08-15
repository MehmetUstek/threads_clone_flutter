import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/components/entry/entry_actions.dart';
import 'package:threads_clone/components/entry/entry_like_reply_details.dart';
import 'package:threads_clone/components/entry/entry_media.dart';
import 'package:threads_clone/components/profile_card_avatar.dart';
import 'package:threads_clone/dtos/entry_dto.dart';
import 'package:threads_clone/pages/entry_page.dart';
import 'package:threads_clone/pages/user_profile_page.dart';
import 'package:threads_clone/utils/utils.dart';

import '../../bloc/like_bloc/like_bloc.dart';
import '../../bloc/like_bloc/like_cubit.dart';

class Entry extends StatefulWidget {
  const Entry({super.key, required this.entryDTO});

  final EntryDTO entryDTO;

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    EntryDTO entryDTO = widget.entryDTO;
    final int replyCount = entryDTO.replyCount;
    int likeCount = entryDTO.likeCount;
    final String username = entryDTO.username;
    final String initials = entryDTO.initials;
    final bool isVerifiedUser = entryDTO.isVerifiedUser;
    final String entryText = entryDTO.entryText;
    final String? photoAddedPath = entryDTO.photoAddedPath;
    final String? profilePhotoPath = entryDTO.profilePhotoPath;

    return BlocProvider(
        create: (BuildContext context) => LikeCubit(likeCount),
        child: BlocBuilder<LikeCubit, int>(builder: (blocContext, state) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () =>
                  pushToNewPage(context, EntryPage(entryDTO: entryDTO)),
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
                          profilePhotoPath: profilePhotoPath,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingToTheSides),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () => pushToNewPage(
                                        context,
                                        UserProfilePage(
                                            username: username,
                                            userBio: "A",
                                            fullName: "A",
                                            followerCount: 12)),
                                    child: Text(
                                      username,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
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
                                padding: const EdgeInsets.only(
                                    top: usernameTextPadding),
                                child: SizedBox(
                                  width: entryMaxWidth(context),
                                  child: Text(
                                    entryText,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                              ),
                              if (photoAddedPath != null)
                                EntryMedia(photoAddedPath: photoAddedPath),
                              EntryActions(
                                onLike: onLike,
                                onUnlike: onUnlike,
                                username: username,
                                blocContext: blocContext,
                              ),
                              EntryLikeReplyDetails(
                                  replyCount: replyCount, likeCount: state)
                            ],
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
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
