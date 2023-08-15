import 'package:flutter/material.dart';

import '../../pages/zoom_media_page.dart';
import '../../utils/utils.dart';

class EntryMedia extends StatelessWidget {
  const EntryMedia(
      {Key? key,
      required this.photoAddedPath,
      required this.withLeftRightPadding})
      : super(key: key);
  final String photoAddedPath;
  final bool withLeftRightPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: photoPadding,
        bottom: usernameTextPadding,
        left: withLeftRightPadding ? paddingToTheSides : 0,
        right: withLeftRightPadding ? paddingToTheSides : 0,
      ),
      child: InkWell(
        onTap: () async => await showDialog(
            useSafeArea: false,
            context: context,
            builder: (_) => ZoomMediaPage(
                mediaPath: photoAddedPath, isMediaCircular: false)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(photoAddedPath, fit: BoxFit.fill, loadingBuilder:
              (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }, width: photoMaxWidth(context)),
        ),
      ),
    );
  }
}
