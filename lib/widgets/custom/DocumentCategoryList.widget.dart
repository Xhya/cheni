import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/widgets/custom/DocumentCategoryItemWithChip.widget.dart';
import 'package:flutter/material.dart';

class DocumentCategoryList extends StatefulWidget {
  const DocumentCategoryList({super.key});

  @override
  State<DocumentCategoryList> createState() => _DocumentCategoryListState();
}

class _DocumentCategoryListState extends State<DocumentCategoryList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        DocumentCategoryEnum.values.length,
        (index1) {
          var category = DocumentCategoryEnum.values[index1];
          return Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(
                  right: index1 != DocumentCategoryEnum.values.length ? 4 : 0,
                ),
                child: DocumentCategoryItemWithChip(
                  state: DocumentCategoryItemWithChipState(
                    documentCategory: category,
                  ),
                ),
              ));

          // return Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       t("document_category_enum_${categoryName}"),
          //       style: TextStyle(fontWeight: FontWeight.bold),
          //     ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: List.generate(
          //     currentDocumentList.length,
          //     (index2) {
          //       var doc = currentDocumentList[index2];
          //       if (doc.category ==
          //           DocumentCategoryEnum.fromText(categoryName)) {
          //         return GestureDetector(
          //           onTap: () {
          //             vm.onClickViewDocument(doc);
          //           },
          //           child: Text(doc.name ?? ""),
          //         );
          //       } else {
          //         return const SizedBox();
          //       }
          //     },
          //   ),
          // ),
          //],
          //);
        },
      ),
    );
  }
}
