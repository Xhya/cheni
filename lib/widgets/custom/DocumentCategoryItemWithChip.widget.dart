import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/widgets/custom/DocumentCategoryItem.widget.dart';
import 'package:flutter/material.dart';

class DocumentCategoryItemWithChipState {
  DocumentCategoryEnum documentCategory;
  String number;

  DocumentCategoryItemWithChipState({
    required this.documentCategory,
    required this.number,
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
    return Stack(
      children: [
        Card(
          elevation: 1,
          margin: const EdgeInsets.all(0),
          color: Colors.white,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: DocumentCategoryItem(
              state: DocumentCategoryItemState(
                documentCategory: widget.state.documentCategory,
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
            decoration: BoxDecoration(
              color: CheniColors().background.three,
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Text(
              widget.state.number,
              style: TextStyle(
                fontSize: 10,
                color: CheniColors().text.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
