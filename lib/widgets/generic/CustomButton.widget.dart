import 'package:flutter/material.dart';

class CustomButtonState {
  late VoidCallback onClick;
  String? text;
  IconData? icon;

  CustomButtonState({
    required this.onClick,
    this.text,
    this.icon,
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
    if (widget.state.text != null) {
      return TextButton(
        onPressed: widget.state.onClick,
        child: Text(widget.state.text!),
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
