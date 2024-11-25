import 'package:cheni/screens/home.viewmodel.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/widgets/custom/DocumentCategoryList.widget.dart';
import 'package:cheni/widgets/custom/HomeHeader.widget.dart';
import 'package:cheni/widgets/generic/CustomButton.widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    var vm = context.read<HomeViewModel>();

    return Container(
      color: CheniColors().background.one,
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
                style: TextStyle(color: CheniColors().text.black, fontSize: 10),
              ),
              const SizedBox(height: 4),
              const DocumentCategoryList()
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: CheniColors().background.four,
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
                      "Déjà 11 documents\nimportés et rangés !",
                      style: TextStyle(
                          color: CheniColors().text.grey, fontSize: 10),
                    ),
                  ],
                ),
                CustomButton(state: vm.bottomAddButton)
              ],
            ),
          )
        ],
      ),
    );
  }
}
