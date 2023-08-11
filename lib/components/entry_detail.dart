import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/entry.dart';
import 'package:threads_clone/components/profile_card_avatar.dart';
import 'package:threads_clone/dtos/entry_dto.dart';
import 'package:threads_clone/utils/utils.dart';

import '../pages/zoom_media_page.dart';

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
    final int likeCount = entryDTO.likeCount;
    final String username = entryDTO.username;
    final String initials = entryDTO.initials;
    final bool isVerifiedUser = entryDTO.isVerifiedUser;
    final String entryText = entryDTO.entryText;
    final String? photoAddedPath = entryDTO.photoAddedPath;
    final String? profilePhotoPath = entryDTO.profilePhotoPath;
    // final List replies= entryDTO.replies; //TODO: Add replies section and data.

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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                    top: photoPadding,
                    bottom: usernameTextPadding,
                    right: paddingToTheSides,
                    left: paddingToTheSides),
                child: InkWell(
                  onTap: () => pushToNewPage(
                      context,
                      ZoomMediaPage(
                        isMediaCircular: false,
                        mediaPath: photoAddedPath,
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(photoAddedPath, fit: BoxFit.fill,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.black),
                      );
                    }, width: photoMaxWidth(context)),
                  ),
                ),
              ),
            const Padding(
              padding: EdgeInsets.only(
                  top: usernameTextPadding,
                  left: paddingToTheSides,
                  right: paddingToTheSides),
              child: Wrap(
                spacing: iconSpacing,
                children: [
                  Icon(
                    CupertinoIcons.heart,
                    size: iconSize,
                  ),
                  Icon(
                    CupertinoIcons.bubble_right,
                    size: iconSize,
                  ),
                  Icon(
                    CupertinoIcons.repeat,
                    size: iconSize,
                  ),
                  Icon(
                    CupertinoIcons.paperplane,
                    size: iconSize,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: usernameTextPadding,
                  left: paddingToTheSides,
                  right: paddingToTheSides),
              child: Row(
                children: [
                  Text(
                    "$replyCount replies",
                    style: const TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Icon(
                      CupertinoIcons.circle_fill,
                      size: 3,
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      "$likeCount likes",
                      style: const TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                color: Colors.grey.shade300,
                width: screenWidth(context),
                height: 1,
              ),
            ),
            Entry(entryDTO: entryDTO),
          ],
        ),
      ),
    );
  }
}
