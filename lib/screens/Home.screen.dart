import 'package:cheni/layout/Default.scaffold.dart';
import 'package:cheni/screens/Home.content.dart';
import 'package:cheni/screens/home.viewmodel.dart';
import 'package:cheni/widgets/generic/AsyncInitWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var vm = HomeViewModel();

    return DefaultScaffold(
      child: AsyncInitWidget(
        initFunction: () {
          vm.init();
        },
        refreshData: () async {
          vm.init();
        },
        child: const HomeContent(),
      ),
    );
  }
}
