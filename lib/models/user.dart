class UserProfile {
  final String name;
  final String profileImagePath;
  final String highestAwardName;
  final String highestAwardDescription;
  final String awardImagePath;
  final String bikeName;
  final String bikeImagePath;
  final int ridesJoined;
  final String distanceCovered;

  UserProfile({
    required this.name,
    required this.profileImagePath,
    required this.highestAwardName,
    required this.highestAwardDescription,
    required this.awardImagePath,
    required this.bikeName,
    required this.bikeImagePath,
    required this.ridesJoined,
    required this.distanceCovered,
  });
}

final UserProfile currentUser = UserProfile(
  name: "Alwin Joseph",
  profileImagePath: "assets/profile.jpg",
  highestAwardName: "Highest Award",
  highestAwardDescription:
      "Complete a route with significant elevation gain or high-altitude pass.",
  awardImagePath: "assets/Award.png",
  bikeName: "Classic 350 Reborn",
  bikeImagePath: "assets/RE.jpg",
  ridesJoined: 14,
  distanceCovered: "6,124 km",
);
