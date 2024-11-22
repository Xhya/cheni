import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/domains/documents/document.model.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/services/Picture.service.dart';
import 'package:cheni/widgets/generic/CustomButton.widget.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  static final HomeViewModel _singleton = HomeViewModel._internal();

  factory HomeViewModel() {
    return _singleton;
  }

  final pictureService = PictureService();
  final documentDomain = DocumentDomain();

  HomeViewModel._internal();

  late var bottomAddButton = CustomButtonState(
    icon: Icons.add,
    onClick: () {
      pictureService.takePictures();
      var document = Document.build(
        name: "name",
        picturePaths: pictureService.pictures,
        category: DocumentCategoryEnum.assurance,
      );
      documentDomain.currentDocument = document;
      documentDomain.storeDocument();
    },
  );
}
