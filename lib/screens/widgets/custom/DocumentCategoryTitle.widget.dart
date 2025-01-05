import 'package:cheni/core/services/Navigation.service.dart';
import 'package:cheni/core/services/Translation.service.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/utils/String.extension.dart';
import 'package:flutter/material.dart';

class DocumentCategoryTitle extends StatefulWidget {
  const DocumentCategoryTitle({super.key});

  @override
  State<DocumentCategoryTitle> createState() => _DocumentCategoryTitleState();
}

class _DocumentCategoryTitleState extends State<DocumentCategoryTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: CheniColors().background.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 60),
        child: Text(
          t("document_category_enum_${navigationService.currentDocumentCategory?.label}")
              .toCapitalized,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: CheniColors().text.secondary,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
