import 'package:threads_clone/utils/utils.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();
final List search_data = [
  {
    "followerCount": randomNumberGenerator(),
    "username": "janedoe12",
    "isVerifiedUser": true,
    "userBio": "janedoe12",
  },
  {
    "followerCount": randomNumberGenerator(),
    "username": "janedoe12",
    "isVerifiedUser": false,
    "userBio": "janedoe12",
  },
  {
    "followerCount": randomNumberGenerator(),
    "username": "janedoe12",
    "isVerifiedUser": true,
    "userBio": "janedoe12",
  },
];
