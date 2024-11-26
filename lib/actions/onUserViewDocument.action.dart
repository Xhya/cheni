import 'package:cheni/actions/file.action.dart';
import 'package:cheni/actions/picture.action.dart';
import 'package:cheni/domains/documents/document.model.dart';
import 'package:cheni/enums/DocumentType.enum.dart';

onUserViewDocument(Document document) {
  switch (document.type) {
    case DocumentTypeEnum.picture:
      var paths = document.paths;
      if (paths != null) {
        viewPictures(paths);
      }
    case DocumentTypeEnum.pdf:
      var path = document.paths?.firstOrNull;
      if (path != null) {
        openLocalPdfInBrowser(path);
      }
    case null:
      throw Exception("Failed onClickViewDocument");
  }
}
