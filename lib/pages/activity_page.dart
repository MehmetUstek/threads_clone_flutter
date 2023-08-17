import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/components/activity_filters.dart';
import 'package:threads_clone/styles/text_styles.dart';

import '../components/cards/activity_card.dart';
import '../utils/profile_data.dart';
import '../utils/utils.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  State<ActivityPage> createState() => _ActivityPagePageState();
}

class _ActivityPagePageState extends State<ActivityPage> {
  ActivityFiltersEnum activityFiltersEnum = ActivityFiltersEnum.All;
  void setAppliedFilter(ActivityFiltersEnum newFilter) => setState(() {
        activityFiltersEnum = newFilter;
      });

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
          ActivityFilters(
              appliedFilter: activityFiltersEnum,
              setAppliedFilter: setAppliedFilter),
          Expanded(
            child: ListView.builder(
                itemCount: profileData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ActivityCard(
                    profileDTO: profileData.values.elementAt(index),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
