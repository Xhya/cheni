import 'package:cheni/utils/CheniColors.dart';
import 'package:flutter/material.dart';

enum ButtonTypeEnum { outlined, tonal, filled, link }

class CustomButtonState {
  late VoidCallback onClick;
  ButtonTypeEnum type;
  String? text;
  IconData? icon;
  Widget? iconWidget;

  CustomButtonState({
    required this.onClick,
    required this.type,
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
  double _bottomPadding = 4;

  @override
  Widget build(BuildContext context) {
    var backgroundColor = widget.state.type == ButtonTypeEnum.filled
        ? CheniColors().background.primary
        : CheniColors().background.greyDark;
    var foregroundColor = widget.state.type == ButtonTypeEnum.filled
        ? CheniColors().text.secondary
        : CheniColors().text.black;

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
        onTapDown: (_) async {
          setState(() {
            _bottomPadding = 1;
          });
        },
        onTapUp: (_) async {
          await Future.delayed(const Duration(milliseconds: 100));
          widget.state.onClick();
          setState(() {
            _bottomPadding = 4;
          });
        },
        child: Container(
          padding: EdgeInsets.only(
            bottom: _bottomPadding,
            left: 1,
            right: 1,
            top: 1,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: AnimatedPadding(
            curve: Curves.linear,
            padding: EdgeInsets.only(
              bottom: _bottomPadding,
              left: 1,
              right: 1,
              top: 1,
            ),
            duration: const Duration(milliseconds: 100),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: CheniColors().background.secondary,
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
        ),
      );
    } else if (widget.state.icon != null) {
      return CircleAvatar(
        radius: 20,
        backgroundColor: backgroundColor,
        child: IconButton(
          onPressed: widget.state.onClick,
          icon: Icon(widget.state.icon!),
          color: foregroundColor,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
