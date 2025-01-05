import 'package:cheni/utils/CheniColors.dart';
import 'package:flutter/material.dart';

class DateInputState {
  Function? onSelectDate;
  String? content;

  DateInputState({
    this.onSelectDate,
    this.content,
  });
}

class DateInput extends StatefulWidget {
  const DateInput({super.key, required this.state});

  final DateInputState state;

  @override
  State<DateInput> createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  openDatePicker() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      helpText: "Sélectionnez une date",
      confirmText: "OK",
      cancelText: "ANNULER",
      initialEntryMode: DatePickerEntryMode.calendar,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: CheniColors().background.secondary,
              onPrimary: Colors.black,
              onSurface: CheniColors().background.primary,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: CheniColors().text.black,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      widget.state.onSelectDate?.call(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.state.content != null) {
      _controller.text = widget.state.content!;
    }
    return SizedBox(
      height: 35,
      child: TextField(
        controller: widget.state.content != null ? _controller : null,
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
              color: CheniColors().background.primary,
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
    );
  }
}
