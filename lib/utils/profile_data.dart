import 'package:threads_clone/dtos/profile_dto.dart';
import 'package:threads_clone/utils/random_names_data.dart';

final Map<String, ProfileDTO> profileData = {
  "mustek": ProfileDTO(
      isVerifiedUser: true,
      followerCount: 10,
      username: "mustek",
      userBio: "Koc University",
      firstName: 'Mehmet',
      lastName: "Ustek",
      initials: "MU",
      fullName: "Mehmet Ustek",
      userEntryIds: ["1", "2"],
      profilePhotoPath:
          "https://avatars.githubusercontent.com/u/53303474?s=400&u=1dc04b3eb1ac41e765f0f2dd1f9ce717b10122f0&v=4"),
  "janedoe12": ProfileDTO(
    isVerifiedUser: true,
    followerCount: 10,
    username: "janedoe12",
    userBio: "Jane Doe",
    firstName: 'Jane',
    lastName: "Doe",
    initials: "JD",
    fullName: "Jane Doe",
  ),
  "franzk0": ProfileDTO(
    isVerifiedUser: true,
    followerCount: 10,
    username: "franzk0",
    userBio: "Franz K",
    firstName: 'Franz',
    lastName: "K",
    initials: "FK",
    fullName: "Franz K",
  ),
  "kgirenes": ProfileDTO(
    isVerifiedUser: true,
    followerCount: 10,
    username: "kgirenes",
    userBio: "kgirenes",
    firstName: 'Kerem',
    lastName: "G",
    initials: "KG",
    fullName: "Kerem G",
    profilePhotoPath: "https://avatars.githubusercontent.com/u/69321438?v=4",
  ),
  for (String name in randomNames)
    (name[0] + name.split(" ").last).toLowerCase(): ProfileDTO(
      isVerifiedUser: true,
      followerCount: 10,
      username: (name[0] + name.split(" ").last).toLowerCase(),
      userBio: name,
      firstName: name.split(" ").first,
      lastName: name.split(" ").last,
      initials: name[0] + name.split(" ").last[0],
      fullName: name,
    ),
};
