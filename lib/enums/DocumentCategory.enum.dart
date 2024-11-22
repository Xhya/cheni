enum DocumentCategoryEnum {
  assurance('assurance'),
  leasing('leasing'),
  professional('professional');

  const DocumentCategoryEnum(this.label);
  final String label;

  factory DocumentCategoryEnum.fromText(String text) {
    return DocumentCategoryEnum.values.firstWhere((it) => it.label == text);
  }
}
