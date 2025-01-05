import 'package:cheni/utils/CheniColors.dart';
import 'package:flutter/material.dart';

class CustomToggle extends StatefulWidget {
  const CustomToggle({
    super.key,
    required this.selected,
    required this.children,
    required this.onClick,
  });

  final List<bool> selected;
  final List<String> children;
  final Function onClick;

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  var selectedBackgroundColor = Colors.white;
  var notSelectedBackgroundColor = Colors.transparent;
  var fontWeight = FontWeight.bold;
  var selectedTextColor = CheniColors().text.onContrastNeutralBackground;
  var notSelectedTextColor = CheniColors().text.onNeutralBackground;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      child: Container(
        color: CheniColors().background.secondary,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            children: widget.children
                .asMap()
                .entries
                .map(
                  (entry) => CustomToggleItem(
                    index: entry.key,
                    text: entry.value,
                    selected: widget.selected[entry.key],
                    onClick: widget.onClick,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class CustomToggleItem extends StatefulWidget {
  const CustomToggleItem({
    super.key,
    required this.index,
    required this.text,
    required this.selected,
    required this.onClick,
  });

  final int index;
  final String text;
  final bool selected;
  final Function onClick;

  @override
  State<CustomToggleItem> createState() => _CustomToggleItemState();
}

class _CustomToggleItemState extends State<CustomToggleItem> {
  var selectedBackgroundColor = Colors.white;
  var notSelectedBackgroundColor = CheniColors().background.greyDark;
  var selectedFontWeight = FontWeight.bold;
  var notSelectedFontWeight = FontWeight.normal;
  var selectedTextColor = CheniColors().text.black;
  var notSelectedTextColor = CheniColors().text.black;

  @override
  Widget build(BuildContext context) {
    var backgroundColor =
        widget.selected ? selectedBackgroundColor : notSelectedBackgroundColor;
    var textColor = widget.selected ? selectedTextColor : notSelectedTextColor;
    var fontWeight =
        widget.selected ? selectedFontWeight : notSelectedFontWeight;

    return Expanded(
      flex: 1,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: SizedBox(
          height: 40,
          child: Container(
            color: backgroundColor,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                widget.onClick(widget.index);
              },
              child: Text(
                widget.text,
                style: TextStyle(
                  fontWeight: fontWeight,
                  color: textColor,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
