import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/components/entry/entry_actions.dart';
import 'package:threads_clone/components/entry/entry_content.dart';
import 'package:threads_clone/components/entry/entry_like_reply_details.dart';
import 'package:threads_clone/components/entry/entry_line.dart';
import 'package:threads_clone/components/entry/entry_media.dart';
import 'package:threads_clone/components/entry/entry_username.dart';
import 'package:threads_clone/components/profile_card_avatar.dart';
import 'package:threads_clone/dtos/entry_dto.dart';
import 'package:threads_clone/pages/entry_page.dart';
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
  late EntryDTO entryDTO;
  late int replyCount;
  late int likeCount;
  late String username;
  late String initials;
  late bool isVerifiedUser;
  late String entryText;
  late String? photoAddedPath;
  late String? profilePhotoPath;

  @override
  void initState() {
    super.initState();
    entryDTO = widget.entryDTO;
    replyCount = entryDTO.replyCount;
    likeCount = entryDTO.likeCount;
    username = entryDTO.userDetails.username;
    initials = entryDTO.userDetails.initials;
    isVerifiedUser = entryDTO.userDetails.isVerifiedUser;
    entryText = entryDTO.entryText;
    photoAddedPath = entryDTO.photoAddedPath;
    profilePhotoPath = entryDTO.userDetails.profilePhotoPath;
  }

  @override
  Widget build(BuildContext context) {
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
                              EntryUsername(
                                  username: username,
                                  isVerifiedUser: isVerifiedUser),
                              EntryContent(
                                entryText: entryText,
                                withLeftRightPadding: false,
                              ),
                              if (photoAddedPath != null)
                                EntryMedia(
                                  photoAddedPath: photoAddedPath!,
                                  withLeftRightPadding: false,
                                ),
                              EntryActions(
                                onLike: onLike,
                                onUnlike: onUnlike,
                                username: username,
                                blocContext: blocContext,
                                withLeftRightPadding: false,
                              ),
                              EntryLikeReplyDetails(
                                  replyCount: replyCount, likeCount: state)
                            ],
                          ),
                        ),
                      ],
                    ),
                    const EntryLine(),
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
