import 'package:cheni/utils/CheniColors.dart';
import 'package:flutter/material.dart';

enum ButtonTypeEnum { outlined, tonal, filled, link }

class MainButtonState {
  late VoidCallback onClick;
  String? text;
  Widget? iconWidget;

  MainButtonState({
    required this.onClick,
    this.text,
    this.iconWidget,
  });
}

class MainButton extends StatefulWidget {
  const MainButton({super.key, required this.state});

  final MainButtonState state;

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  double _bottomPadding = 4;

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
