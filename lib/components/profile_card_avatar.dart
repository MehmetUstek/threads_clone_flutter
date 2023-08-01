import 'package:flutter/material.dart';

import '../styles/text_styles.dart';
import '../utils/utils.dart';

class ProfileCardAvatar extends StatelessWidget {
  const ProfileCardAvatar({Key? key, required this.initials}) : super(key: key);
  final String initials;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: paddingToTheSides),
      child: SizedBox(
        width: 45,
        height: 45,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange.shade800,
              child:
                  Text(initials, style: normalTextStyle(color: Colors.white)),
            ),
            Positioned(
                bottom: -13,
                right: -13,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      maximumSize: Size(30, 30),
                      minimumSize: Size(20, 20),
                      elevation: 2.0,
                      padding: EdgeInsets.all(0.1),
                      shape: CircleBorder(),
                      backgroundColor: Colors.black),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 10,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
