import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class EntryLine extends StatelessWidget {
  const EntryLine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        color: Colors.grey.shade300,
        width: screenWidth(context),
        height: 1,
      ),
    );
  }
}
