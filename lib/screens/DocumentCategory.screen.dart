import 'package:cheni/actions/onUserViewDocument.action.dart';
import 'package:cheni/domains/documents/Document.domain.dart';
import 'package:cheni/layout/Default.scaffold.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/widgets/custom/DocumentCategoryTitle.widget.dart';
import 'package:cheni/widgets/generic/AsyncInitWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DocumentCategoryScreen extends StatefulWidget {
  const DocumentCategoryScreen({super.key});

  @override
  State<DocumentCategoryScreen> createState() => _DocumentCategoryScreenState();
}

class _DocumentCategoryScreenState extends State<DocumentCategoryScreen> {
  var documentDomain = DocumentDomain();

  @override
  Widget build(BuildContext context) {
    var currentDocumentList =
        context.select((DocumentDomain s) => s.currentDocumentList);

    return DefaultScaffold(
      child: AsyncInitWidget(
        initFunction: () {},
        child: Container(
          color: CheniColors().background.one,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DocumentCategoryTitle(),
              const SizedBox(height: 24),
              Text(
                "Vue d'ensemble",
                style: TextStyle(color: CheniColors().text.black, fontSize: 10),
              ),
              const SizedBox(height: 4),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      currentDocumentList.length,
                      (index) {
                        var doc = currentDocumentList[index];
                        return GestureDetector(
                          onTap: () {
                            onUserViewDocument(doc);
                          },
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 5),
                            color: Colors.white,
                            child: Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(doc.name ?? ""),
                                  Text(doc.getFormattedCreationDate()),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
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
