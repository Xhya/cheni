import 'package:cheni/services/Translation.service.dart';

enum DocumentCategoryEnum {
  assurance('assurance'),
  car('car'),
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
      case DocumentCategoryEnum.professional:
        return "$assetName/pro.svg";
      case DocumentCategoryEnum.assurance:
        return "$assetName/house.svg";
      case DocumentCategoryEnum.car:
        return "$assetName/car.svg";
    }
  }

  getCategoryTrad() {
    return TranslationService().textFR["document_category_enum_$label"];
  }
}
