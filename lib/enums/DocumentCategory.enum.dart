import 'package:cheni/services/Translation.service.dart';

enum DocumentCategoryEnum {
  assurance('assurance'),
  leasing('leasing'),
  professional('professional'),
  health('health');

  const DocumentCategoryEnum(this.label);
  final String label;

  factory DocumentCategoryEnum.fromText(String text) {
    return DocumentCategoryEnum.values.firstWhere((it) => it.label == text);
  }

  getAssetName() {
    var assetName = 'assets/icons';
    switch (this) {
      case DocumentCategoryEnum.health:
        return "$assetName/health.svg";
      default:
        return "$assetName/health.svg";
    }
  }

  getCategoryTrad() {
    switch (this) {
      case DocumentCategoryEnum.health:
        return TranslationService().textFR["document_category_enum_health"];
      default:
        return TranslationService().textFR["document_category_enum_health"];
    }
  }
}
