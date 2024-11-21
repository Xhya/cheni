import 'package:cheni/widgets/generic/Loader.widget.dart';
import 'package:flutter/material.dart';

class AsyncInitWidget extends StatefulWidget {
  const AsyncInitWidget(
      {super.key, required this.child, required this.initFunction});

  final Widget child;
  final Function initFunction;

  @override
  State<AsyncInitWidget> createState() => _AsyncInitWidgetState();
}

class _AsyncInitWidgetState extends State<AsyncInitWidget> {
  bool _init = false;

  @override
  Widget build(BuildContext context) {
    initData() async {
      if (_init == false) {
        await widget.initFunction();
        setState(() => _init = true);
      }
    }

    return FutureBuilder<void>(
      future: initData(),
      builder: (context, AsyncSnapshot<void> snapshot) {
        if (_init == true) {
          return widget.child;
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(child: LoaderIcon());
          default:
            return RefreshIndicator(
              onRefresh: () => initData(),
              child: widget.child,
            );
        }
      },
    );
  }
}
