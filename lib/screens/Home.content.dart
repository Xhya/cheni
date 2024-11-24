import 'package:cheni/screens/home.viewmodel.dart';
import 'package:cheni/services/Translation.service.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/widgets/custom/HomeHeader.widget.dart';
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
    var vm = context.read<HomeViewModel>();
    var documentCategories =
        context.select((DocumentDomain s) => s.documentCategories);
    var currentDocumentList =
        context.select((DocumentDomain s) => s.currentDocumentList);

    return Container(
      color: CheniColors().background.one,
      padding: const EdgeInsets.all(16),
      child: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HomeHeaderWidget(),
          ],
          // children: List.generate(
          //   documentCategories.length,
          //   (index1) {
          //     var categoryName = documentCategories[index1];

          //     return Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           t("document_category_enum_${categoryName}"),
          //           style: TextStyle(fontWeight: FontWeight.bold),
          //         ),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: List.generate(
          //             currentDocumentList.length,
          //             (index2) {
          //               var doc = currentDocumentList[index2];
          //               if (doc.category ==
          //                   DocumentCategoryEnum.fromText(categoryName)) {
          //                 return GestureDetector(
          //                   onTap: () {
          //                     vm.onClickViewDocument(doc);
          //                   },
          //                   child: Text(doc.name ?? ""),
          //                 );
          //               } else {
          //                 return const SizedBox();
          //               }
          //             },
          //           ),
          //         ),
          //       ],
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
