import 'package:threads_clone/dtos/entry_dto.dart';
import 'package:threads_clone/utils/text_utils.dart';
import 'package:threads_clone/utils/utils.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();
final List entry_data = [
  {
    "replyCount": randomNumberGenerator(),
    "username": "janedoe12",
    "isVerifiedUser": true,
    "likeCount": randomNumberGenerator(),
    "entryText": lipsum_text,
    "entryId": uuid.v4(),
  },
  {
    "replyCount": randomNumberGenerator(),
    "username": "franzk0",
    "isVerifiedUser": true,
    "likeCount": randomNumberGenerator(),
    "entryText": short_lipsum_text,
    "entryId": uuid.v4(),
  },
  {
    "replyCount": randomNumberGenerator(),
    "username": "ari_99",
    "likeCount": randomNumberGenerator(),
    "isVerifiedUser": false,
    "entryText": short_lipsum_text,
    "photoAddedPath":
        'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
    "entryId": uuid.v4(),
  },
  {
    "replyCount": randomNumberGenerator(),
    "username": "mustek",
    "isVerifiedUser": false,
    "likeCount": randomNumberGenerator(),
    "entryText": short_lipsum_text,
    "photoAddedPath": 'https://media.giphy.com/media/1GlDW1HBD3q2A/giphy.gif',
    "entryId": uuid.v4(),
  }
];
