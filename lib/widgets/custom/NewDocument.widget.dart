import 'package:cheni/actions/createDocument.action.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
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
    return Card(
      elevation: 1,
      child: Column(
        children: [
          TextField(
            onChanged: (String value) {
              onUpdateDocumentName(value);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nommer le document',
            ),
          ),
          DropdownMenu<DocumentCategoryEnum>(
            requestFocusOnTap: true,
            label: const Text('Catégorie'),
            onSelected: (DocumentCategoryEnum? category) {
              if (category != null) {
                onUpdateDocumentCategory(category);
              }
            },
            dropdownMenuEntries: DocumentCategoryEnum.values
                .map<DropdownMenuEntry<DocumentCategoryEnum>>(
              (DocumentCategoryEnum category) {
                return DropdownMenuEntry<DocumentCategoryEnum>(
                  value: category,
                  label: category.label,
                );
              },
            ).toList(),
          ),
          CustomButton(
            state: CustomButtonState(
              text: "Valider",
              onClick: () async {
                await onSubmitNewDocument();
              },
            ),
          )
        ],
      ),
    );
  }
}
