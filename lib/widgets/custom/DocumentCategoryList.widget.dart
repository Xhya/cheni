import 'package:cheni/actions/navigations.action.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/widgets/custom/DocumentCategoryItemWithChip.widget.dart';

class DocumentCategoryList extends StatefulWidget {
  const DocumentCategoryList(
      {super.key, this.displayChip = true, this.canClick = true});

  final bool displayChip;
  final bool canClick;

  @override
  State<DocumentCategoryList> createState() => _DocumentCategoryListState();
}

class _DocumentCategoryListState extends State<DocumentCategoryList> {
  @override
  Widget build(BuildContext context) {
    var categoriesCounts =
        context.select((DocumentDomain s) => s.categoriesCounts);

    return Row(
      children: List.generate(
        DocumentCategoryEnum.values.length,
        (index1) {
          var category = DocumentCategoryEnum.values[index1];
          return Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                if (widget.canClick) {
                  navigateToCategory(category);
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
