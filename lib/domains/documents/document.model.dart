import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/enums/DocumentType.enum.dart';
import 'package:cheni/utils/types.dart';

class Document {
  final String id;
  final String? name;
  final DocumentCategoryEnum? category;
  final List<CustomPath>? paths;
  final DateTime? createdAt;
  final DocumentTypeEnum? type;

  Document({
    required this.id,
    this.name,
    this.category,
    this.paths,
    this.createdAt,
    this.type,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json["id"] as String,
      name: json["name"] as String,
      paths:
          (json['paths'] as List<dynamic>).map((item) => item as CustomPath).toList(),
      category: DocumentCategoryEnum.fromText(json["category"]),
      createdAt: DateTime.parse(json['createdAt']).toLocal(),
      type: DocumentTypeEnum.fromText(json["type"]),
    );
  }

  Map toJson() {
    return {
      "id": id,
      "name": name,
      "category": category?.label,
      "paths": paths,
      "createdAt": createdAt?.toIso8601String(),
      "type": type?.label,
    };
  }

  factory Document.build({
    required String name,
    required List<CustomPath> paths,
    required DocumentCategoryEnum category,
    required DocumentTypeEnum type,
  }) {
    return Document(
      id: name,
      name: name,
      paths: paths,
      category: category,
      type: type,
      createdAt: DateTime.now(),
    );
  }
}
