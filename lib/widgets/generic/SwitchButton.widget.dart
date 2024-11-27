import 'package:cheni/utils/CheniColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class SwitchButtonState {
  bool activated;
  Function onSwitch;

  SwitchButtonState({
    required this.activated,
    required this.onSwitch,
  });
}

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key, required this.state});

  final SwitchButtonState state;

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.state.onSwitch();
      },
      child: Row(
        children: [
          FlutterSwitch(
            value: widget.state.activated,
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
              widget.state.onSwitch();
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
    );
  }
}
