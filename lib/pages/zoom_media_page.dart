import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:threads_clone/utils/utils.dart';

class ZoomMediaPage extends StatelessWidget {
  const ZoomMediaPage(
      {Key? key, required this.mediaPath, required this.isMediaCircular})
      : super(key: key);
  final String mediaPath;
  final bool isMediaCircular;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isMediaCircular ? Colors.white.withOpacity(0.8) : Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton.small(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: isMediaCircular ? Colors.black : Colors.white,
          onPressed: () => popPage(context),
          child: Icon(CupertinoIcons.xmark,
              size: 20, color: isMediaCircular ? Colors.white : Colors.black)),
      body: Center(
        child: isMediaCircular
            ? CircleAvatar(
                maxRadius: screenWidth(context) / 2.3,
                backgroundImage: NetworkImage(mediaPath),
              )
            : Image.network(mediaPath),
      ),
    );
  }
}
