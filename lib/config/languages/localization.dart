import 'package:e_shop/config/languages/en.dart';
import 'package:get/get.dart';

import '../consts_strings.dart';
import 'ar.dart';
import 'fr.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ene: en,
        ara: ar,
        fre: fr,
      };
}
