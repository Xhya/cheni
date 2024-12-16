import 'package:flutter/material.dart';

class DefaultScaffold extends StatefulWidget {
  const DefaultScaffold({super.key, required this.child});

  final Widget child;

  @override
  State<DefaultScaffold> createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.purple,
      //   automaticallyImplyLeading: false,
      //   flexibleSpace: const Column(
      //     children: [
      //       Expanded(
      //         flex: 1,
      //         child: Padding(
      //             padding: EdgeInsets.only(left: 12, right: 24, top: 4),
      //             child: Text("Hello!")),
      //       ),
      //     ],
      //   ),
      // ),
      body: Material(
        child: widget.child,
      ),
    );
  }
}
