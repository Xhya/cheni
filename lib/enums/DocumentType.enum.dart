enum DocumentTypeEnum {
  picture('picture'),
  pdf('pdf');

  const DocumentTypeEnum(this.label);
  final String label;

  factory DocumentTypeEnum.fromText(String text) {
    return DocumentTypeEnum.values.firstWhere((it) => it.label == text);
  }
}
