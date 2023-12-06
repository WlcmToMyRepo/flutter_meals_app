import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future init() async {
    return await SharedPreferences.getInstance();
  }
}
