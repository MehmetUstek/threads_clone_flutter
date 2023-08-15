import 'package:threads_clone/utils/profile_data.dart';
import 'package:threads_clone/utils/text_utils.dart';
import 'package:threads_clone/utils/utils.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();
final List homepage_entryData = [
  {
    "replyCount": randomNumberGenerator(),
    "userDetails": profileData["mustek"],
    "likeCount": randomNumberGenerator(),
    "entryText": shortLipsumText,
    "photoAddedPath": 'https://media.giphy.com/media/1GlDW1HBD3q2A/giphy.gif',
    "entryId": uuid.v4(),
    "profilePhotoPath":
        "https://avatars.githubusercontent.com/u/53303474?s=400&u=1dc04b3eb1ac41e765f0f2dd1f9ce717b10122f0&v=4",
    "replies": [
      {
        "replyCount": randomNumberGenerator(),
        "userDetails": profileData["franzk0"],
        "likeCount": randomNumberGenerator(),
        "entryText": shortLipsumText,
        "entryId": uuid.v4(),
      },
    ]
  },
  {
    "replyCount": randomNumberGenerator(),
    "userDetails": profileData["janedoe12"],
    "likeCount": randomNumberGenerator(),
    "entryText": lipsumText,
    "entryId": uuid.v4(),
    "replies": [
      {
        "replyCount": randomNumberGenerator(),
        "userDetails": profileData["mustek"],
        "likeCount": randomNumberGenerator(),
        "entryText": shortLipsumText,
        "photoAddedPath":
            'https://media.giphy.com/media/1GlDW1HBD3q2A/giphy.gif',
        "entryId": uuid.v4()
      },
      {
        "replyCount": randomNumberGenerator(),
        "userDetails": profileData["franzk0"],
        "likeCount": randomNumberGenerator(),
        "entryText": shortLipsumText,
        "entryId": uuid.v4(),
      },
    ]
  },
  {
    "replyCount": randomNumberGenerator(),
    "userDetails": profileData["franzk0"],
    "likeCount": randomNumberGenerator(),
    "entryText": shortLipsumText,
    "entryId": uuid.v4(),
  },
  {
    "replyCount": randomNumberGenerator(),
    "userDetails": profileData["kgirenes"],
    "likeCount": randomNumberGenerator(),
    "entryText": shortLipsumText,
    "photoAddedPath":
        'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
    "entryId": uuid.v4(),
  },
];
