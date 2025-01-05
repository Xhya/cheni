import 'package:cheni/models/document.model.dart';
import 'package:cheni/models/enums/DocumentCategory.enum.dart';
import 'package:cheni/models/enums/DocumentType.enum.dart';

var fixtureDocumentHealth = Document(
  id: "",
  name: "Contrat de santé",
  category: DocumentCategoryEnum.health,
  paths: [],
  createdAt: DateTime.now(),
  type: DocumentTypeEnum.pdf,
);
