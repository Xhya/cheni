import 'package:cheni/actions/onUserClickHomeScreenBottomButton.action.dart';
import 'package:cheni/domains/documents/Document.service.dart';
import 'package:cheni/screens/widgets/generic/MainButton.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeViewModel extends ChangeNotifier {
  init() async {
    await documentService.refreshDocumentList();
    await documentService.refreshStats();
  }

  late var bottomAddButton = MainButtonState(
    iconWidget: SvgPicture.asset(
      "assets/icons/add.svg",
      width: 16,
      height: 16,
    ),
    text: "document",
    onClick: () {
      onUserClickHomeScreenBottomButton();
    },
  );
}
