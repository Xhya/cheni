import 'package:cheni/core/services/Error.service.dart';
import 'package:flutter/material.dart';

class ErrorDialogWidget extends StatelessWidget {
  const ErrorDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var errorService = ErrorService();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: AlertDialog(
        backgroundColor: Colors.amber,
        title: const Text(
          "Erreur",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        content: Text(
          errorService.currentException.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        icon: const Icon(
          Icons.error,
          size: 50,
          color: Colors.amber,
        ),
      ),
    );
  }
}
