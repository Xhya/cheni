import 'package:cheni/enums/DocumentCategory.enum.dart';

class Document {
  final String id;
  final DocumentCategoryEnum? category;
  final String? fileName;
  final String? content;
  final DateTime? createdAt;

  Document({
    required this.id,
    this.category,
    this.fileName,
    this.content,
    this.createdAt,
  });

  Document copyWith({
    String? id,
  }) {
    return Document(
      id: id ?? this.id,
      fileName: fileName,
      category: category,
      content: content,
      createdAt: createdAt,
    );
  }

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'],
      fileName: json['filename'],
      content: json['content'],
      category: json['category'],
    );
  }
}
