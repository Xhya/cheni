import 'package:cheni/actions/onUserSubmitNewDocument.dart';
import 'package:cheni/domains/documents/Document.service.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/widgets/custom/DocumentCategoryList.widget.dart';
import 'package:cheni/widgets/generic/CustomButton.widget.dart';
import 'package:flutter/material.dart';

class NewDocumentWidget extends StatefulWidget {
  const NewDocumentWidget({super.key});

  @override
  State<NewDocumentWidget> createState() => _NewDocumentWidgetState();
}

class _NewDocumentWidgetState extends State<NewDocumentWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Stack(
        children: [
          Container(
            color: CheniColors().background.one,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  onChanged: (String value) {
                    documentService.onUpdateDocumentName(value);
                  },
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      hintText: 'Nommer le document',
                      labelStyle: TextStyle(color: CheniColors().text.grey)),
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 16),
                Text(
                  "Catégories",
                  style:
                      TextStyle(color: CheniColors().text.black, fontSize: 10),
                ),
                const SizedBox(height: 4),
                const DocumentCategoryList(displayChip: false),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  state: CustomButtonState(
                    type: ButtonTypeEnum.tonal,
                    icon: Icons.arrow_back,
                    onClick: () {},
                  ),
                ),
                CustomButton(
                  state: CustomButtonState(
                    type: ButtonTypeEnum.filled,
                    icon: Icons.check,
                    onClick: () async {
                      await onUserSubmitNewDocument();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
