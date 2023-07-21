import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'card_button.dart';

class ActivityFilters extends StatelessWidget {
  const ActivityFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: activityFiltersData.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CardButton(
                buttonTitle: activityFiltersData[index],
                fixedWith: 110,
                backgroundColor: Colors.grey[900],
                textColor: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
