import 'package:flutter/material.dart';

import '../../pages/zoom_media_page.dart';
import '../../utils/utils.dart';

class EntryMedia extends StatelessWidget {
  const EntryMedia({Key? key, required this.photoAddedPath}) : super(key: key);
  final String photoAddedPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: photoPadding, bottom: usernameTextPadding),
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
