import 'dart:io';
import 'package:cheni/core/services/Picture.service.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:cheni/screens/layout/Default.scaffold.dart';

class ImageViewerScreen extends StatefulWidget {
  const ImageViewerScreen({super.key});

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: Builder(
        builder: (context) {
          if (pictureService.picturePaths.length == 1) {
            final imageFile = File(pictureService.picturePaths.first);
            return Stack(
              children: [
                PhotoView(
                  imageProvider: FileImage(imageFile),
                )
              ],
            );
          } else if (pictureService.picturePaths.length > 1) {
            return PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                final imageFile = File(pictureService.picturePaths[index]);

                return PhotoViewGalleryPageOptions(
                  imageProvider: FileImage(imageFile),
                  initialScale: PhotoViewComputedScale.contained * 0.8,
                );
              },
              itemCount: pictureService.picturePaths.length,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
