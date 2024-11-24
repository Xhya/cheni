import 'package:cheni/screens/home.viewmodel.dart';
import 'package:cheni/services/Translation.service.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/widgets/custom/DocumentCategoryList.widget.dart';
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
    var currentDocumentList =
        context.select((DocumentDomain s) => s.currentDocumentList);

    return Container(
      color: CheniColors().background.one,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HomeHeaderWidget(),
            const SizedBox(height: 32),
            Text(
              "Catégories",
              style: TextStyle(color: CheniColors().text.black, fontSize: 10),
            ),
            const SizedBox(height: 4),
            const DocumentCategoryList()
          ],
        ),
      ),
    );
  }
}
