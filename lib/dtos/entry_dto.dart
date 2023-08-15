import 'package:threads_clone/dtos/profile_dto.dart';

class EntryDTO {
  final int replyCount;
  final int likeCount;
  final String entryText;
  final String? photoAddedPath;
  final String entryId;
  List<EntryDTO>? replies;
  final ProfileDTO userDetails;

  EntryDTO(
      {required this.replyCount,
      required this.likeCount,
      this.photoAddedPath,
      required this.entryText,
      required this.entryId,
      required this.userDetails,
      this.replies});
  EntryDTO.fromJson(Map<String, dynamic> json)
      : replyCount = json['replyCount'],
        likeCount = json['likeCount'],
        entryText = json['entryText'],
        photoAddedPath = json['photoAddedPath'],
        userDetails = json["userDetails"],
        entryId = json['entryId'],
        replies = json["replies"] != null
            ? List<EntryDTO>.from(
                json["replies"].map((model) => EntryDTO.fromJson(model)))
            : [];

  Map<String, dynamic> toJson() => {
        'replyCount': replyCount,
        'likeCount': likeCount,
        'entryText': entryText,
        'photoAddedPath': photoAddedPath,
        'entryId': entryId,
      };
}
