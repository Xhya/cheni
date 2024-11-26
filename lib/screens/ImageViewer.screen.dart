import 'dart:io';
import 'package:cheni/states/Picture.state.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:cheni/layout/Default.scaffold.dart';

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
          if (pictureState.picturePaths.length == 1) {
            final imageFile = File(pictureState.picturePaths.first);
            return Stack(
              children: [
                PhotoView(
                  imageProvider: FileImage(imageFile),
                )
              ],
            );
          } else if (pictureState.picturePaths.length > 1) {
            return PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                final imageFile = File(pictureState.picturePaths[index]);

                return PhotoViewGalleryPageOptions(
                  imageProvider: FileImage(imageFile),
                  initialScale: PhotoViewComputedScale.contained * 0.8,
                );
              },
              itemCount: pictureState.picturePaths.length,
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
