import 'package:cheni/services/Picture.service.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:cheni/layout/Default.scaffold.dart';

class ImageViewerScreen extends StatefulWidget {
  const ImageViewerScreen({super.key});

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  @override
  Widget build(BuildContext context) {
    final pictureService = PictureService();

    return DefaultScaffold(
      child: pictureService.currentPicturePath != null
          ? PhotoView(
              imageProvider: AssetImage(pictureService.currentPicturePath!),
            )
          : const SizedBox(),
    );
  }
}
