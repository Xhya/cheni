import 'package:cheni/services/Translation.service.dart';
import 'package:provider/provider.dart';
import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    final documentService = context.read<DocumentDomain>();
    final t = context.read<TranslationService>().t;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            documentService.documentCategories.length,
            (index) {
              return Text(
                t("document_category_enum_${documentService.documentCategories[index]}"),
              );
            },
          ),
        ),
      ),
    );
  }
}
