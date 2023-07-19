import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/entry_dto.dart';
import 'package:threads_clone/utils/text_utils.dart';
import 'package:threads_clone/utils/utils.dart';

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
    final int likeCount = entryDTO.likeCount;
    final String username = entryDTO.username;
    final bool isVerifiedUser = entryDTO.isVerifiedUser;
    final String entryText = entryDTO.entryText;
    final String? photoAddedPath = entryDTO.photoAddedPath;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: const Icon(CupertinoIcons.add),
                    width: iconWidth,
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
                            Text(
                              username,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            if (isVerifiedUser)
                              Padding(
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
                        Padding(
                          padding:
                              const EdgeInsets.only(top: usernameTextPadding),
                          child: SizedBox(
                            width: entryMaxWidth(context),
                            child: Text(
                              entryText,
                              style: TextStyle(fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                        if (photoAddedPath != null)
                          Padding(
                            padding: EdgeInsets.only(
                                top: photoPadding, bottom: usernameTextPadding),
                            child: Image.network(photoAddedPath,
                                width: photoMaxWidth(context)),
                          ),
                        const Padding(
                          padding: EdgeInsets.only(top: usernameTextPadding),
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
                          padding: EdgeInsets.only(top: usernameTextPadding),
                          child: Row(
                            children: [
                              Text(
                                "$replyCount replies",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Icon(
                                  CupertinoIcons.circle_fill,
                                  size: 3,
                                  color: Colors.grey,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "$likeCount likes",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  color: Colors.grey.shade300,
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}