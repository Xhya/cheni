import 'package:cheni/layout/Default.scaffold.dart';
import 'package:cheni/screens/Home.content.dart';
import 'package:cheni/screens/home.viewmodel.dart';
import 'package:cheni/services/Permission.service.dart';
import 'package:cheni/widgets/generic/AsyncInitWidget.dart';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
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

    void onPressed() async {
      await PermissionService().requestPermissions();
      try {
        var pictures = await CunningDocumentScanner.getPictures() ?? [];
        if (!mounted) return;
      } catch (e) {
        print(e);
      }
    }

    return DefaultScaffold(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            onPressed();
          },
          tooltip: 'Create',
          child: const Icon(Icons.add),
        ),
        body: AsyncInitWidget(
          initFunction: () {},
          refreshData: () async {},
          child: const HomeContent(),
        ),
      ),
    );
  }
}
