class EntryDTO {
  final int replyCount;
  final int likeCount;
  final String username;
  final bool isVerifiedUser;
  final String entryText;
  final String? photoAddedPath;
  final String entryId;
  final String firstName;
  final String lastName;
  final String initials;

  EntryDTO(
      {required this.replyCount,
      required this.likeCount,
      this.isVerifiedUser = false,
      this.photoAddedPath,
      required this.username,
      required this.entryText,
      required this.entryId,
      required this.firstName,
      required this.lastName,
      required this.initials});
  EntryDTO.fromJson(Map<String, dynamic> json)
      : replyCount = json['replyCount'],
        likeCount = json['likeCount'],
        username = json['username'],
        isVerifiedUser = json['isVerifiedUser'],
        entryText = json['entryText'],
        photoAddedPath = json['photoAddedPath'],
        entryId = json['entryId'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        initials =
            json['firstName'].toString()[0] + json['lastName'].toString()[0];

  Map<String, dynamic> toJson() => {
        'replyCount': replyCount,
        'likeCount': likeCount,
        'username': username,
        'isVerifiedUser': isVerifiedUser,
        'entryText': entryText,
        'photoAddedPath': photoAddedPath,
        'entryId': entryId,
      };
}
