import 'package:cheni/core/actions/onInitHomeScreen.action.dart';
import 'package:cheni/core/actions/onUserClickHomeScreenBottomButton.action.dart';
import 'package:cheni/core/domains/documents/Document.service.dart';
import 'package:provider/provider.dart';
import 'package:cheni/screens/layout/Default.scaffold.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/screens/widgets/custom/DocumentCategoryList.widget.dart';
import 'package:cheni/screens/widgets/custom/HomeHeader.widget.dart';
import 'package:cheni/screens/widgets/generic/AsyncInitWidget.dart';
import 'package:cheni/screens/widgets/generic/MainButton.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var documentCount = context.select((DocumentService s) => s.documentCount);

    return DefaultScaffold(
      child: AsyncInitWidget(
        initFunction: () {
          onInitHomeScreen();
        },
        refreshData: () async {
          onInitHomeScreen();
        },
        child: Container(
          color: CheniColors().background.grey,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const HomeHeaderWidget(),
                  const SizedBox(height: 32),
                  Text(
                    "Catégories",
                    style: TextStyle(
                        color: CheniColors().text.black, fontSize: 10),
                  ),
                  const SizedBox(height: 4),
                  const DocumentCategoryList()
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: CheniColors().background.greyDark,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/clap.svg",
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Déjà $documentCount documents\nimportés et rangés !",
                          style: TextStyle(
                              color: CheniColors().text.grey, fontSize: 10),
                        ),
                      ],
                    ),
                    MainButton(
                      state: MainButtonState(
                        iconWidget: SvgPicture.asset(
                          "assets/icons/add.svg",
                          width: 16,
                          height: 16,
                        ),
                        text: "document",
                        onClick: () {
                          onUserClickHomeScreenBottomButton();
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
