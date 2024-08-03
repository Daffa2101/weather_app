import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/services/logger_service.dart';

class PrefService {
  static SharedPreferences? _pref;

  static Future<void> init() async {
    LoggerService.i('Initializing Shared Preference Service');
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> saveString(String key, String value) async {
    await _pref!.setString(key, value);
  }

  static Future<void> saveListOfString(String key, List<String> value) async {
    await _pref!.setStringList(key, value);
  }

  static String? getString(String key) {
    return _pref!.getString(key);
  }

  static List<String>? getStringList(String key) {
    return _pref!.getStringList(key);
  }

  static Future<void> removeKey(String key) async {
    await _pref!.remove(key);
  }
}
