import 'package:cheni/actions/createDocument.action.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/widgets/custom/DocumentCategoryList.widget.dart';
import 'package:flutter/material.dart';

class NewDocumentWidget extends StatefulWidget {
  const NewDocumentWidget({super.key});

  @override
  State<NewDocumentWidget> createState() => _NewDocumentWidgetState();
}

class _NewDocumentWidgetState extends State<NewDocumentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CheniColors().background.one,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (String value) {
              onUpdateDocumentName(value);
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              hintText: 'Nommer le document',
              labelStyle: TextStyle(color: CheniColors().text.grey)
            ),
            style: const TextStyle(fontSize: 12),
          ),
          const SizedBox(height: 16),
          Text(
            "Catégories",
            style: TextStyle(color: CheniColors().text.black, fontSize: 10),
          ),
          const SizedBox(height: 4),
          const DocumentCategoryList(displayChip: false, canClick: false),
          // CustomButton(
          //   state: CustomButtonState(
          //     text: "Valider",
          //     onClick: () async {
          //       await onSubmitNewDocument();
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
