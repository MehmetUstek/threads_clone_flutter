import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/dtos/entry_dto.dart';
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
          width: screenWidth(context),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: iconWidth,
                    child: Icon(CupertinoIcons.add),
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
                        Padding(
                          padding:
                              const EdgeInsets.only(top: usernameTextPadding),
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
                          Padding(
                            padding: const EdgeInsets.only(
                                top: photoPadding, bottom: usernameTextPadding),
                            child:
                                Image.network(photoAddedPath, fit: BoxFit.fill,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.black),
                              );
                            }, width: photoMaxWidth(context)),
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
                          padding:
                              const EdgeInsets.only(top: usernameTextPadding),
                          child: Row(
                            children: [
                              Text(
                                "$replyCount replies",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
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
                  width: screenWidth(context),
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
