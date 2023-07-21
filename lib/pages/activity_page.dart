import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/activity_filters.dart';
import 'package:threads_clone/styles/text_styles.dart';

import '../components/activity_card.dart';
import '../dtos/profile_dto.dart';
import '../utils/search_data.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPagePageState();
}

class _ActivityPagePageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Activity",
              style: header(),
            ),
          ),
          ActivityFilters(),
          Expanded(
            child: ListView.builder(
                itemCount: searchData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ActivityCard(
                    profileDTO: ProfileDTO.fromJson(searchData[index]),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
