import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/widgets/generic/CustomButton.widget.dart';
import 'package:flutter/material.dart';

class NewDocumentWidgetState {
  late Function onValidate;
  late Function onUpdateName;
  late Function onUpdateCategory;

  NewDocumentWidgetState({
    required this.onValidate,
    required this.onUpdateName,
    required this.onUpdateCategory,
  });
}

class NewDocumentWidget extends StatefulWidget {
  const NewDocumentWidget({super.key, required this.state});

  final NewDocumentWidgetState state;
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
              widget.state.onUpdateName(value);
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
