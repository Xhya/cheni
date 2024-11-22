import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
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
        await pictureService.takePictures();
        if (pictureService.picturePaths.isNotEmpty) {
          navigationService.showDialog!.call(
            NewDocumentDialog(state: newDocumentDialogState),
          );
        }
      } catch (e) {
        print(e);
      }
    },
  );

  late var newDocumentDialogState = NewDocumentDialogState(
    onValidate: () async {
      try {
        documentDomain.buildCurrentDocument();
        await documentDomain.storeDocument();
        await documentDomain.refreshDocumentList();
        documentDomain.resetCurrentDocument();
      } catch (e) {
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
}
