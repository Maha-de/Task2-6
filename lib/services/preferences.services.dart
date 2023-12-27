import 'package:shared_preferences/shared_preferences.dart';

abstract class PrefrencesService {
  static SharedPreferences? prefs;

  static bool checkUser() {
    return prefs?.getBool('isLogin') ?? false;
  }

}
