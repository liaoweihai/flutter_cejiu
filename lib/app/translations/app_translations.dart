import 'package:flutter_cejiu/app/translations/en_us/en_us_translations.dart';
import 'package:flutter_cejiu/app/translations/zh_cn/zh_cn_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_us': enUS,
    'zh_cn': zhCN
  };
}
