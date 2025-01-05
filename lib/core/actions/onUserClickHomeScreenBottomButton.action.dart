import 'package:cheni/core/actions/onUserImportPDF.action.dart';
import 'package:cheni/core/actions/onUserScanFile.action.dart';
import 'package:cheni/core/services/Navigation.service.dart';
import 'package:cheni/core/services/Translation.service.dart';
import 'package:flutter/material.dart';

onUserClickHomeScreenBottomButton() async {
  // Open menu
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
          // TODO: import pictures
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
}
