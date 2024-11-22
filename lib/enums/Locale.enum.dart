enum LocaleEnum {
  fr('fr'),
  en('en');

  const LocaleEnum(this.label);
  final String label;

  factory LocaleEnum.fromText(String text) {
    return LocaleEnum.values.firstWhere((it) => it.label == text);
  }
}
