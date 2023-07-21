class ProfileDTO {
  final int followerCount;
  final String username;
  final String userBio;
  final String? profilePhotoPath;
  final bool isVerifiedUser;

  ProfileDTO({
    required this.followerCount,
    required this.username,
    required this.userBio,
    this.profilePhotoPath,
    this.isVerifiedUser = false,
  });

  ProfileDTO.fromJson(Map<String, dynamic> json)
      : followerCount = json['followerCount'],
        username = json['username'],
        userBio = json['userBio'],
        isVerifiedUser = json['isVerifiedUser'],
        profilePhotoPath = json['profilePhotoPath'];

  Map<String, dynamic> toJson() => {
        'followerCount': followerCount,
        'username': username,
        'userBio': userBio,
        'profilePhotoPath': profilePhotoPath,
        'isVerifiedUser': isVerifiedUser,
      };
}
