import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/widgets/generic/CustomButton.widget.dart';
import 'package:flutter/material.dart';

class NewDocumentDialogState {
  late Function onValidate;
  late Function onUpdateName;
  late Function onUpdateCategory;

  NewDocumentDialogState({
    required this.onValidate,
    required this.onUpdateName,
    required this.onUpdateCategory,
  });
}

class NewDocumentDialog extends StatefulWidget {
  const NewDocumentDialog({super.key, required this.state});

  final NewDocumentDialogState state;
  @override
  State<NewDocumentDialog> createState() => _NewDocumentDialogState();
}

class _NewDocumentDialogState extends State<NewDocumentDialog> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(
        children: [
          TextField(
            onChanged: (String value) {
              widget.state.onUpdateName(value);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Nom du fichier',
            ),
          ),
          DropdownMenu<DocumentCategoryEnum>(
            initialSelection: DocumentCategoryEnum.assurance,
            requestFocusOnTap: true,
            label: const Text('Catégorie'),
            onSelected: (DocumentCategoryEnum? category) {
              widget.state.onUpdateCategory(category);
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
                await widget.state.onValidate();
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
