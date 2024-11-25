import 'package:cheni/layout/Default.scaffold.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/widgets/custom/DocumentCategoryTitle.widget.dart';
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
              DocumentCategoryTitle(),
              
            ],
          ),
        ),
      ),
    );
  }
}
