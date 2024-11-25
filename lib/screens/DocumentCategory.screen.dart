import 'package:cheni/layout/Default.scaffold.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:cheni/services/Translation.service.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/utils/String.extension.dart';
import 'package:cheni/widgets/generic/AsyncInitWidget.dart';
import 'package:flutter/material.dart';

class DocumentCategory extends StatefulWidget {
  const DocumentCategory({super.key});

  @override
  State<DocumentCategory> createState() => _DocumentCategoryState();
}

class _DocumentCategoryState extends State<DocumentCategory> {
  @override
  Widget build(BuildContext context) {
    var navigationService = NavigationService();

    return DefaultScaffold(
      child: AsyncInitWidget(
        initFunction: () {},
        refreshData: () async {},
        child: Container(
          color: CheniColors().background.one,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: CheniColors().background.two,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
