import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/widgets/custom/DocumentCategoryItem.widget.dart';
import 'package:flutter/material.dart';

class DocumentCategoryItemWithChipState {
  DocumentCategoryEnum documentCategory;

  DocumentCategoryItemWithChipState({
    required this.documentCategory,
  });
}

class DocumentCategoryItemWithChip extends StatefulWidget {
  const DocumentCategoryItemWithChip({super.key, required this.state});

  final DocumentCategoryItemWithChipState state;

  @override
  State<DocumentCategoryItemWithChip> createState() =>
      _DocumentCategoryItemWithChipState();
}

class _DocumentCategoryItemWithChipState
    extends State<DocumentCategoryItemWithChip> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.all(0),
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: DocumentCategoryItem(
          state: DocumentCategoryItemState(
            documentCategory: widget.state.documentCategory,
          ),
        ),
      ),
    );
  }
}
