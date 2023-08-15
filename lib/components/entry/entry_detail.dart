import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/components/entry/entry.dart';
import 'package:threads_clone/components/profile_card_avatar.dart';
import 'package:threads_clone/dtos/entry_dto.dart';
import 'package:threads_clone/utils/utils.dart';

import '../../bloc/like_bloc/like_bloc.dart';
import '../../bloc/like_bloc/like_cubit.dart';
import 'entry_actions.dart';
import 'entry_like_reply_details.dart';
import 'entry_media.dart';

class EntryDetail extends StatefulWidget {
  const EntryDetail({super.key, required this.entryDTO});

  final EntryDTO entryDTO;

  @override
  State<EntryDetail> createState() => _EntryDetailState();
}

class _EntryDetailState extends State<EntryDetail> {
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
    final List<EntryDTO>? replies =
        entryDTO.replies; //TODO: Add replies section and data.

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
                  Padding(
                    padding: const EdgeInsets.only(
                        left: paddingToTheSides, right: paddingToTheSides),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ProfileCardAvatar(
                            initials: initials,
                            profilePhotoPath: profilePhotoPath,
                            paddingToTheSide: 0),
                        Padding(
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: usernameTextPadding,
                        left: paddingToTheSides,
                        right: paddingToTheSides),
                    child: Text(
                      entryText,
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                  if (photoAddedPath != null)
                    Padding(
                      padding: const EdgeInsets.only(
                          top: usernameTextPadding,
                          left: paddingToTheSides,
                          right: paddingToTheSides),
                      child: EntryMedia(photoAddedPath: photoAddedPath),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: usernameTextPadding,
                        left: paddingToTheSides,
                        right: paddingToTheSides),
                    child: EntryActions(
                      onLike: onLike,
                      onUnlike: onUnlike,
                      username: username,
                      blocContext: blocContext,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: usernameTextPadding,
                        left: paddingToTheSides,
                        right: paddingToTheSides),
                    child: EntryLikeReplyDetails(
                        replyCount: replyCount, likeCount: state),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      color: Colors.grey.shade300,
                      width: screenWidth(context),
                      height: 1,
                    ),
                  ),
                  if (replies != null)
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: replies.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Entry(
                            entryDTO: replies[index],
                          );
                        }),
                ],
              ),
            ),
          );
        }));
  }
}
