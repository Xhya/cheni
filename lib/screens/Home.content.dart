import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/services/Picture.service.dart';
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
    var pictureService = PictureService();
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
            (index1) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t("document_category_enum_${documentCategories[index1]}"),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      currentDocumentList.length,
                      (index2) {
                        if (currentDocumentList[index2].category ==
                            DocumentCategoryEnum.fromText(
                                documentCategories[index1])) {
                          return GestureDetector(
                            onTap: () {
                              var paths = currentDocumentList[index2].paths;
                              if (paths != null) {
                                pictureService.viewPictures(paths);
                              }
                            },
                            child: Text(
                              currentDocumentList[index2].name ?? "",
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
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
