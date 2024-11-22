import 'package:cheni/enums/DocumentCategory.enum.dart';
import 'package:cheni/utils/types.dart';

class Document {
  final String id;
  final String? name;
  final DocumentCategoryEnum? category;
  final List<PicturePath>? paths;
  final DateTime? createdAt;

  Document({
    required this.id,
    this.name,
    this.category,
    this.paths,
    this.createdAt,
  });

  Document copyWith({
    String? id,
  }) {
    return Document(
      id: id ?? this.id,
      name: name,
      paths: paths,
      category: category,
      createdAt: createdAt,
    );
  }

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json["id"] as String,
      name: json["name"] as String,
      paths: (json['paths'] as List<dynamic>)
          .map((item) => item as PicturePath)
          .toList(),
      category: DocumentCategoryEnum.fromText(json["category"]),
      createdAt: DateTime.parse(json['createdAt']).toLocal(),
    );
  }

  Map toJson() {
    return {
      "id": id,
      "name": name,
      "category": category?.label,
      "paths": paths,
      "createdAt": createdAt?.toIso8601String(),
    };
  }

  factory Document.build({
    required String name,
    required List<PicturePath> picturePaths,
    required DocumentCategoryEnum category,
  }) {
    return Document(
      id: name,
      name: name,
      paths: picturePaths,
      category: category,
      createdAt: DateTime.now(),
    );
  }
}
