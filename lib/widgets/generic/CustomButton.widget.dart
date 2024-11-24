import 'package:cheni/utils/CheniColors.dart';
import 'package:flutter/material.dart';

class CustomButtonState {
  late VoidCallback onClick;
  String? text;
  IconData? icon;
  Widget? iconWidget;

  CustomButtonState({
    required this.onClick,
    this.text,
    this.icon,
    this.iconWidget,
  });
}

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.state});

  final CustomButtonState state;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    if (widget.state.text != null && widget.state.iconWidget == null) {
      return TextButton(
        onPressed: widget.state.onClick,
        child: Text(
          widget.state.text!,
          style: TextStyle(color: CheniColors().text.black, fontSize: 14),
        ),
      );
    } else if (widget.state.text != null && widget.state.iconWidget != null) {
      return GestureDetector(
        onTap: widget.state.onClick,
        child: Container(
          padding: const EdgeInsets.only(bottom: 8, left: 1, right: 1, top: 1),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: CheniColors().background.five,
              border: Border(
                bottom: BorderSide(
                  color: CheniColors().border.black,
                ),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                widget.state.iconWidget!,
                const SizedBox(width: 8),
                Text(
                  widget.state.text!,
                  style: TextStyle(
                    color: CheniColors().text.black,
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else if (widget.state.icon != null) {
      return IconButton(
        onPressed: widget.state.onClick,
        icon: Icon(widget.state.icon!),
      );
    } else {
      return const SizedBox();
    }
  }
}
