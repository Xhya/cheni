import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/domains/documents/document.model.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/services/File.service.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Picture.service.dart';
import 'package:cheni/services/Translation.service.dart';
import 'package:cheni/widgets/custom/newDocument.dialog.dart';
import 'package:cheni/widgets/generic/CustomButton.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    iconWidget: SvgPicture.asset(
      "assets/icons/add.svg",
      width: 16,
      height: 16,
    ),
    text: "document",
    onClick: () {
      navigationService.showMenu?.call(
        items: [
          PopupMenuItem(
            onTap: () async {
              await _onUserImportPDF();
            },
            child: SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(t("import_file")),
                  const Icon(Icons.picture_as_pdf_outlined, size: 20),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            onTap: () async {
              await _onUserImportPhotos();
            },
            child: SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(t("import_photo")),
                  const Icon(Icons.photo_camera_back_outlined, size: 20),
                ],
              ),
            ),
          ),
          PopupMenuItem(
            onTap: () async {
              await _onUserImportScanFile();
            },
            child: SizedBox(
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(t("scan_file")),
                  const Icon(Icons.camera_alt_outlined, size: 20),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );

  _onUserImportPDF() async {
    try {
      await fileService.pickPDF();
      documentDomain.currentPaths = [fileService.currentFilePath];
      documentDomain.currentType = DocumentTypeEnum.pdf;
      if (fileService.currentFilePath.isNotEmpty) {
        navigationService.showDialog!.call(
          NewDocumentDialog(state: newDocumentFromPdfDialogState),
        );
      }
    } catch (e) {
      documentDomain.resetCurrentDocument();
      fileService.resetFile();
      print(e);
    }
  }

  _onUserImportScanFile() async {
    try {
      await pictureService.takePictures();
      documentDomain.currentPaths = pictureService.picturePaths;
      documentDomain.currentType = DocumentTypeEnum.picture;
      if (pictureService.picturePaths.isNotEmpty) {
        navigationService.showDialog!.call(
          NewDocumentDialog(state: newDocumentFromPicturesDialogState),
        );
      }
    } catch (e) {
      documentDomain.resetCurrentDocument();
      pictureService.resetPicture();
      print(e);
    }
  }

  _onUserImportPhotos() async {
    try {} catch (e) {}
  }

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
