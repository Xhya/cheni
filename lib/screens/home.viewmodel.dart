import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/domains/documents/document.model.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/services/File.service.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Picture.service.dart';
import 'package:cheni/widgets/custom/newDocument.dialog.dart';
import 'package:cheni/widgets/generic/CustomButton.widget.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  static final HomeViewModel _singleton = HomeViewModel._internal();

  factory HomeViewModel() {
    return _singleton;
  }

  final pictureService = PictureService();
  final fileService = FileService();
  final documentDomain = DocumentDomain();
  final navigationService = NavigationService();

  HomeViewModel._internal();

  init() async {
    documentDomain.refreshDocumentList();
  }

  late var bottomAddButton = CustomButtonState(
    icon: Icons.add,
    onClick: () async {
      try {
        if (true) {
          await fileService.pickPDF();
          documentDomain.currentPaths = [fileService.currentFilePath];
          documentDomain.currentType = DocumentTypeEnum.pdf;
          if (fileService.currentFilePath.isNotEmpty) {
            navigationService.showDialog!.call(
              NewDocumentDialog(state: newDocumentFromPdfDialogState),
            );
          }
        } else {
          await pictureService.takePictures();
          documentDomain.currentPaths = pictureService.picturePaths;
          documentDomain.currentType = DocumentTypeEnum.picture;
          if (pictureService.picturePaths.isNotEmpty) {
            navigationService.showDialog!.call(
              NewDocumentDialog(state: newDocumentFromPicturesDialogState),
            );
          }
        }
      } catch (e) {
        documentDomain.resetCurrentDocument();
        fileService.resetFile();
        pictureService.resetPicture();
        print(e);
      }
    },
  );

  late var newDocumentFromPicturesDialogState = NewDocumentDialogState(
    onValidate: () async {
      try {
        documentDomain.buildCurrentDocument();
        await documentDomain.storeDocument();
        await documentDomain.refreshDocumentList();
        documentDomain.resetCurrentDocument();
      } catch (e) {
        documentDomain.resetCurrentDocument();
        pictureService.resetPicture();
        print(e);
      }
    },
    onUpdateName: (String value) {
      documentDomain.currentName = value;
    },
    onUpdateCategory: (DocumentCategoryEnum value) {
      documentDomain.currentCategory = value;
    },
  );

  late var newDocumentFromPdfDialogState = NewDocumentDialogState(
    onValidate: () async {
      try {
        await fileService.savePDF();
        documentDomain.buildCurrentDocument();
        await documentDomain.storeDocument();
        await documentDomain.refreshDocumentList();
        documentDomain.resetCurrentDocument();
      } catch (e) {
        documentDomain.resetCurrentDocument();
        fileService.resetFile();
        print(e);
      }
    },
    onUpdateName: (String value) {
      fileService.currentFileName = value;
      documentDomain.currentName = value;
    },
    onUpdateCategory: (DocumentCategoryEnum value) {
      documentDomain.currentCategory = value;
    },
  );

  onClickViewDocument(Document document) {
    switch (document.type) {
      case DocumentTypeEnum.picture:
        var paths = document.paths;
        if (paths != null) {
          pictureService.viewPictures(paths);
        }
      case DocumentTypeEnum.pdf:
        var path = document.paths?.firstOrNull;
        if (path != null) {
          fileService.openLocalPdfInBrowser(path);
        }
      case null:
        throw Exception("Failed onClickViewDocument");
    }
  }
}
