import 'package:cheni/actions/current.action.dart';
import 'package:cheni/actions/onUserImportPDF.action.dart';
import 'package:cheni/actions/onUserScanFile.action.dart';
import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/services/File.service.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Picture.service.dart';
import 'package:cheni/services/Translation.service.dart';
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
    await documentDomain.refreshDocumentList();
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
              await onUserImportPDF();
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
              await onUserScanFile();
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

  _onUserImportPhotos() async {
    currentUserAction = CurrentUserActionEnum.addingDocument;
    try {} catch (e) {}
  }
}
