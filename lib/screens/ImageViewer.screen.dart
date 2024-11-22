import 'dart:io';

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

    final imageFile = File(pictureService.currentPicturePath!);

    return DefaultScaffold(
      child: pictureService.currentPicturePath != null
          ? Stack(
              children: [
                PhotoView(
                  imageProvider: FileImage(imageFile),
                )
              ],
            )
          : const SizedBox(),
    );
  }
}
