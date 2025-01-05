import 'package:provider/provider.dart';
import 'package:cheni/core/actions/onUserSubmitNewDocument.dart';
import 'package:cheni/core/domains/documents/Document.service.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/screens/widgets/custom/DocumentCategoryList.widget.dart';
import 'package:cheni/screens/widgets/generic/CustomButton.widget.dart';
import 'package:cheni/screens/widgets/generic/DateInput.widget.dart';
import 'package:cheni/screens/widgets/generic/SwitchButton.widget.dart';
import 'package:flutter/material.dart';

class NewDocumentWidget extends StatefulWidget {
  const NewDocumentWidget({super.key});

  @override
  State<NewDocumentWidget> createState() => _NewDocumentWidgetState();
}

class _NewDocumentWidgetState extends State<NewDocumentWidget> {
  var showNotificationDate = false;

  @override
  Widget build(BuildContext context) {
    var currentNotificationDateString = context.select(
      (DocumentService s) => s.currentNotificationDateString,
    );

    return Expanded(
      flex: 1,
      child: Stack(
        children: [
          Container(
            color: CheniColors().background.grey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 35,
                  child: TextField(
                    onChanged: (String value) {
                      documentService.onUpdateDocumentName(value);
                    },
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(
                          color: CheniColors().background.primary,
                        ),
                      ),
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      hintText: 'Nommer le document',
                      labelStyle: TextStyle(color: CheniColors().text.grey),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 15,
                      ),
                    ),
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Catégories",
                  style: TextStyle(
                    color: CheniColors().text.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const DocumentCategoryList(displayChip: false),
                const SizedBox(height: 16),
                SwitchButton(
                  state: SwitchButtonState(
                    activated: showNotificationDate,
                    onSwitch: () {
                      setState(() {
                        showNotificationDate = !showNotificationDate;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 4),
                if (showNotificationDate)
                  DateInput(
                    state: DateInputState(
                      content: currentNotificationDateString,
                      onSelectDate: (DateTime date) {
                        documentService.currentNotificationDate = date;
                        documentService.notify();
                      },
                    ),
                  )
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
