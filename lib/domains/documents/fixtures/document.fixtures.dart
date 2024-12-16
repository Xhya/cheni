import 'package:cheni/domains/documents/document.model.dart';
import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/enums/DocumentType.enum.dart';

var fixtureDocumentHealth = Document(
  id: "",
  name: "Contrat de santé",
  category: DocumentCategoryEnum.health,
  paths: [],
  createdAt: DateTime.now(),
  type: DocumentTypeEnum.pdf,
);
