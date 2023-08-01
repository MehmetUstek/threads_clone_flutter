import 'package:threads_clone/utils/text_utils.dart';
import 'package:threads_clone/utils/utils.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();
final List entryData = [
  {
    "replyCount": randomNumberGenerator(),
    "username": "janedoe12",
    "isVerifiedUser": true,
    "likeCount": randomNumberGenerator(),
    "entryText": lipsumText,
    "entryId": uuid.v4(),
    "firstName": "Jane",
    "lastName": "Doe"
  },
  {
    "replyCount": randomNumberGenerator(),
    "username": "franzk0",
    "isVerifiedUser": true,
    "likeCount": randomNumberGenerator(),
    "entryText": shortLipsumText,
    "entryId": uuid.v4(),
    "firstName": "Franz",
    "lastName": "K"
  },
  {
    "replyCount": randomNumberGenerator(),
    "username": "ari_99",
    "likeCount": randomNumberGenerator(),
    "isVerifiedUser": false,
    "entryText": shortLipsumText,
    "photoAddedPath":
        'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
    "entryId": uuid.v4(),
    "firstName": "Ari",
    "lastName": "A"
  },
  {
    "replyCount": randomNumberGenerator(),
    "username": "mustek",
    "isVerifiedUser": false,
    "likeCount": randomNumberGenerator(),
    "entryText": shortLipsumText,
    "photoAddedPath": 'https://media.giphy.com/media/1GlDW1HBD3q2A/giphy.gif',
    "entryId": uuid.v4(),
    "firstName": "Mehmet",
    "lastName": "Ustek"
  }
];
