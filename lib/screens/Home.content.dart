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
    final t = context.read<TranslationService>().t;
    var documentCategories =
        context.select((DocumentDomain s) => s.documentCategories);
    var currentDocumentList =
        context.select((DocumentDomain s) => s.currentDocumentList);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(
            documentCategories.length,
            (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t("document_category_enum_${documentCategories[index]}"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      currentDocumentList.length,
                      (index) {
                        return Text(
                          currentDocumentList[index].name ?? "",
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
