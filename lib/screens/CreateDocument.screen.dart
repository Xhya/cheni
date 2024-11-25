import 'package:cheni/layout/Default.scaffold.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/widgets/custom/NewDocument.widget.dart';
import 'package:flutter/material.dart';

class CreateDocumentScreen extends StatefulWidget {
  const CreateDocumentScreen({super.key});

  @override
  State<CreateDocumentScreen> createState() => _CreateDocumentScreenState();
}

class _CreateDocumentScreenState extends State<CreateDocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(color: CheniColors().background.two),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.center,
                width: double.maxFinite,
                child:
                    const Icon(Icons.file_copy, color: Colors.white, size: 52),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                decoration: BoxDecoration(
                  color: CheniColors().background.one,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24),
                    topLeft: Radius.circular(24),
                  ),
                ),
                child: const Column(
                  children: [NewDocumentWidget()],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
