class EntryDTO {
  final int replyCount;
  final int likeCount;
  final String username;
  final bool isVerifiedUser;
  final String entryText;
  final String? photoAddedPath;
  final String entryId;

  EntryDTO({
    required this.replyCount,
    required this.likeCount,
    this.isVerifiedUser = false,
    this.photoAddedPath,
    required this.username,
    required this.entryText,
    required this.entryId,
  });
  EntryDTO.fromJson(Map<String, dynamic> json)
      : replyCount = json['replyCount'],
        likeCount = json['likeCount'],
        username = json['username'],
        isVerifiedUser = json['isVerifiedUser'],
        entryText = json['entryText'],
        photoAddedPath = json['photoAddedPath'],
        entryId = json['entryId'];

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
