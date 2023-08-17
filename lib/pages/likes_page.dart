import 'package:flutter/material.dart';
import 'package:threads_clone/components/scaffold_with_name.dart';
import 'package:threads_clone/dtos/back_button_enum.dart';

import '../components/cards/profile_card.dart';
import '../utils/profile_data.dart';

class LikesPage extends StatelessWidget {
  const LikesPage({Key? key, required this.likeCount}) : super(key: key);
  final int likeCount;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithName(
      pageName: '$likeCount likes',
      backbuttonEnum: BackButtonEnum.back,
      body: ListView.builder(
          itemCount: profileData.length,
          itemBuilder: (BuildContext context, int index) {
            return ProfileCard(
              profileDTO: profileData.values.elementAt(index),
              followerCountVisible: false,
            );
          }),
    );
  }
}
