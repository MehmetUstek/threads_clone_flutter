import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/components/entry/entry_detail_profile_info.dart';
import 'package:threads_clone/components/entry/entry_line.dart';
import 'package:threads_clone/components/entry/entry_replies.dart';
import 'package:threads_clone/dtos/entry_dto.dart';
import 'package:threads_clone/utils/utils.dart';

import '../../bloc/like_bloc/like_bloc.dart';
import '../../bloc/like_bloc/like_cubit.dart';
import 'entry_actions.dart';
import 'entry_content.dart';
import 'entry_like_reply_details.dart';
import 'entry_media.dart';

class EntryDetail extends StatefulWidget {
  const EntryDetail({super.key, required this.entryDTO});

  final EntryDTO entryDTO;

  @override
  State<EntryDetail> createState() => _EntryDetailState();
}

class _EntryDetailState extends State<EntryDetail> {
  late EntryDTO entryDTO;
  late int replyCount;
  late int likeCount;
  late String username;
  late String initials;
  late bool isVerifiedUser;
  late String entryText;
  late String? photoAddedPath;
  late String? profilePhotoPath;
  late List<EntryDTO>? replies;
  @override
  void initState() {
    super.initState();
    entryDTO = widget.entryDTO;
    replyCount = entryDTO.replyCount;
    likeCount = entryDTO.likeCount;
    username = entryDTO.username;
    initials = entryDTO.initials;
    isVerifiedUser = entryDTO.isVerifiedUser;
    entryText = entryDTO.entryText;
    photoAddedPath = entryDTO.photoAddedPath;
    profilePhotoPath = entryDTO.profilePhotoPath;
    replies = entryDTO.replies;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LikeCubit(likeCount),
        child: BlocBuilder<LikeCubit, int>(builder: (blocContext, state) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: SizedBox(
              width: screenWidth(context),
              child: ListView(
                children: [
                  EntryDetailProfileInfo(
                      initials: initials,
                      username: username,
                      isVerifiedUser: isVerifiedUser,
                      profilePhotoPath: profilePhotoPath),
                  EntryContent(
                    entryText: entryText,
                    withLeftRightPadding: true,
                  ),
                  if (photoAddedPath != null)
                    EntryMedia(
                      photoAddedPath: photoAddedPath!,
                      withLeftRightPadding: true,
                    ),
                  EntryActions(
                    onLike: onLike,
                    onUnlike: onUnlike,
                    username: username,
                    blocContext: blocContext,
                    withLeftRightPadding: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: usernameTextPadding,
                        left: paddingToTheSides,
                        right: paddingToTheSides),
                    child: EntryLikeReplyDetails(
                        replyCount: replyCount, likeCount: state),
                  ),
                  const EntryLine(),
                  if (replies != null)
                    EntryReplies(
                      replies: replies!,
                    )
                ],
              ),
            ),
          );
        }));
  }
}
