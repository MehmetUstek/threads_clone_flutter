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
      backgroundColor: isMediaCircular ? Colors.grey : Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton.small(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: isMediaCircular ? Colors.black : Colors.black,
          onPressed: () => popPage(context),
          child: Icon(CupertinoIcons.xmark,
              size: 20, color: isMediaCircular ? Colors.white : Colors.white)),
      body: Dismissible(
        direction: DismissDirection.vertical,
        key: const Key('key'),
        onDismissed: (_) => popPage(context),
        resizeDuration: const Duration(milliseconds: 1),
        child: Center(
          child: isMediaCircular
              ? CircleAvatar(
                  maxRadius: screenWidth(context) / 2.3,
                  backgroundImage: NetworkImage(mediaPath),
                )
              : Image.network(mediaPath),
        ),
      ),
    );
  }
}

// class ImageDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       child: Container(
//         width: 200,
//         height: 200,
//         decoration: BoxDecoration(
//             image: DecorationImage(
//                 image: NetworkImage(photoAddedPath), fit: BoxFit.cover)),
//       ),
//     );
//   }
// }
