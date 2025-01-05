import 'package:cheni/core/actions/current.action.dart';
import 'package:cheni/core/actions/onUserNavigateToCategory.action.dart';
import 'package:cheni/core/domains/documents/Document.service.dart';
import 'package:cheni/models/enums/DocumentCategory.enum.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cheni/screens/widgets/custom/DocumentCategoryItemWithChip.widget.dart';

class DocumentCategoryList extends StatefulWidget {
  const DocumentCategoryList({super.key, this.displayChip = true});

  final bool displayChip;

  @override
  State<DocumentCategoryList> createState() => _DocumentCategoryListState();
}

class _DocumentCategoryListState extends State<DocumentCategoryList> {
  @override
  Widget build(BuildContext context) {
    var categoriesCounts =
        context.select((DocumentService s) => s.categoriesCounts);

    return Row(
      children: List.generate(
        DocumentCategoryEnum.values.length,
        (index1) {
          var category = DocumentCategoryEnum.values[index1];
          return Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                switch (currentUserAction) {
                  case CurrentUserActionEnum.navigating:
                    onUserNavigateToCategory(category);
                  case CurrentUserActionEnum.addingDocument:
                    documentService.onUpdateDocumentCategory(category);
                  default:
                    throw "Not possible";
                }
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: index1 != DocumentCategoryEnum.values.length ? 4 : 0,
                ),
                child: DocumentCategoryItemWithChip(
                  state: DocumentCategoryItemWithChipState(
                    documentCategory: category,
                    number: categoriesCounts[category.label].toString(),
                    displayChip: widget.displayChip,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
