import 'package:cheni/models/document.model.dart';
import 'package:cheni/models/enums/DocumentType.enum.dart';
import 'package:cheni/core/services/File.service.dart';
import 'package:cheni/core/services/Picture.service.dart';

onUserViewDocument(Document document) {
  switch (document.type) {
    case DocumentTypeEnum.picture:
      var paths = document.paths;
      if (paths != null) {
        pictureService.viewPictures(paths);
      }
    case DocumentTypeEnum.pdf:
      var path = document.paths?.firstOrNull;
      if (path != null) {
        fileService.openLocalPdfInBrowser(path);
      }
    case null:
      throw Exception("Failed onClickViewDocument");
  }
}
