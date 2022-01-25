import 'package:flutter_soon/app/translations/en_US/en_us_translations.dart';
import 'package:flutter_soon/app/translations/es_ZH/es_mx_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_us': enUs,
    'es_zh': esZh
  };
}
