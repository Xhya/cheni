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
