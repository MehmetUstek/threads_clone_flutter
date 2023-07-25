import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'card_button.dart';

class ActivityFilters extends StatelessWidget {
  const ActivityFilters(
      {Key? key, required this.appliedFilter, required this.setAppliedFilter})
      : super(key: key);
  final ActivityFiltersEnum appliedFilter;
  final Function(ActivityFiltersEnum) setAppliedFilter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: ActivityFiltersEnum.values.length,
          itemBuilder: (BuildContext context, int index) {
            ActivityFiltersEnum currentFilter =
                ActivityFiltersEnum.values[index];
            return Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CardButton(
                buttonTitle: currentFilter.name,
                fixedWidth: 110,
                backgroundColor: Colors.grey[900],
                textColor: Colors.white,
                isActive: appliedFilter == currentFilter,
                onPressed: () => {setAppliedFilter(currentFilter)},
              ),
            );
          },
        ),
      ),
    );
  }
}
