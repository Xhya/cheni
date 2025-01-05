import 'package:cheni/models/enums/DocumentCategory.enum.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DocumentCategoryItemState {
  DocumentCategoryEnum documentCategory;

  DocumentCategoryItemState({
    required this.documentCategory,
  });
}

class DocumentCategoryItem extends StatefulWidget {
  const DocumentCategoryItem({super.key, required this.state});

  final DocumentCategoryItemState state;

  @override
  State<DocumentCategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<DocumentCategoryItem> {
  @override
  Widget build(BuildContext context) {
    String assetName = widget.state.documentCategory.getAssetName();
    String text = widget.state.documentCategory.getCategoryTrad();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          assetName,
          width: 16,
          height: 16,
        ),
        Text(
          text,
          style: TextStyle(color: CheniColors().text.grey, fontSize: 10),
        ),
      ],
    );
  }
}
