import 'package:cheni/actions/onUserSubmitNewDocument.dart';
import 'package:cheni/domains/documents/Document.service.dart';
import 'package:cheni/utils/CheniColors.dart';
import 'package:cheni/widgets/custom/DocumentCategoryList.widget.dart';
import 'package:cheni/widgets/generic/CustomButton.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NewDocumentWidget extends StatefulWidget {
  const NewDocumentWidget({super.key});

  @override
  State<NewDocumentWidget> createState() => _NewDocumentWidgetState();
}

class _NewDocumentWidgetState extends State<NewDocumentWidget> {
  var showNotificationDate = false;

  @override
  Widget build(BuildContext context) {
    openDatePicker() async {
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
        helpText: "Sélectionnez une date",
        confirmText: "OK",
        cancelText: "ANNULER",
        initialEntryMode:
            DatePickerEntryMode.calendar, // Mode par défaut (calendrier)
      );
    }

    return Expanded(
      flex: 1,
      child: Stack(
        children: [
          Container(
            color: CheniColors().background.one,
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
                          color: CheniColors().background.two,
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
                Row(
                  children: [
                    FlutterSwitch(
                      value: showNotificationDate,
                      width: 20,
                      height: 12,
                      toggleSize: 10,
                      borderRadius: 30,
                      padding: 2,
                      activeColor: CheniColors().background.two,
                      inactiveColor: Colors.grey,
                      activeToggleColor: CheniColors().background.five,
                      inactiveToggleColor: Colors.white,
                      onToggle: (value) {
                        setState(() {
                          showNotificationDate = value;
                        });
                      },
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Une échéance est-elle nécessaire ?",
                      style: TextStyle(
                        color: CheniColors().text.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                if (showNotificationDate)
                  SizedBox(
                    height: 35,
                    child: TextField(
                      onTap: () {
                        openDatePicker();
                      },
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.date_range),
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                          borderSide: BorderSide(
                            color: CheniColors().background.two,
                          ),
                        ),
                        hintText: 'jj.mm.aa',
                        labelStyle: TextStyle(color: CheniColors().text.grey),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 15,
                        ),
                      ),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
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
