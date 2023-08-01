class ProfileDTO {
  final int followerCount;
  final String username;
  final String userBio;
  final String? profilePhotoPath;
  final bool isVerifiedUser;
  final String firstName;
  final String lastName;
  final String initials;

  ProfileDTO(
      {required this.followerCount,
      required this.username,
      required this.userBio,
      this.profilePhotoPath,
      this.isVerifiedUser = false,
      required this.firstName,
      required this.lastName,
      required this.initials});

  ProfileDTO.fromJson(Map<String, dynamic> json)
      : followerCount = json['followerCount'],
        username = json['username'],
        userBio = json['userBio'],
        isVerifiedUser = json['isVerifiedUser'],
        profilePhotoPath = json['profilePhotoPath'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        initials =
            json['firstName'].toString()[0] + json['lastName'].toString()[0];

  Map<String, dynamic> toJson() => {
        'followerCount': followerCount,
        'username': username,
        'userBio': userBio,
        'profilePhotoPath': profilePhotoPath,
        'isVerifiedUser': isVerifiedUser,
      };
}
