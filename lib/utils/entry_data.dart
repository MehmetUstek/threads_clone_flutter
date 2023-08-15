import 'package:threads_clone/utils/profile_data.dart';
import 'package:threads_clone/utils/text_utils.dart';
import 'package:threads_clone/utils/utils.dart';

import '../dtos/entry_dto.dart';

final Map<String, EntryDTO> entryData = {
  "1": EntryDTO(
    replyCount: randomNumberGenerator(),
    likeCount: randomNumberGenerator(),
    entryText: shortLipsumText,
    photoAddedPath: 'https://media.giphy.com/media/1GlDW1HBD3q2A/giphy.gif',
    entryId: "1",
    userDetails: profileData["mustek"]!,
    replies: [
      EntryDTO(
        replyCount: randomNumberGenerator(),
        userDetails: profileData["franzk0"]!,
        likeCount: randomNumberGenerator(),
        entryText: shortLipsumText,
        entryId: "3",
      ),
    ],
  ),
  "2": EntryDTO(
    replyCount: randomNumberGenerator(),
    likeCount: randomNumberGenerator(),
    entryText: shortLipsumText,
    entryId: "2",
    userDetails: profileData["mustek"]!,
    replies: [
      EntryDTO(
        replyCount: randomNumberGenerator(),
        userDetails: profileData["franzk0"]!,
        likeCount: randomNumberGenerator(),
        entryText: shortLipsumText,
        entryId: "2",
      ),
    ],
  ),
};
