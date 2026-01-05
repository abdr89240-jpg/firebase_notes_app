import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<void> saveData(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    switch(value.runtimeType) {
      case const (String):
        await prefs.setString(key, value);
        break;
      case const (int):
        await prefs.setInt(key, value);
        break;
      case const (double):
        await prefs.setDouble(key, value);
        break;
      case const (bool):
        await prefs.setBool(key, value);
        break;
      case const (List<String>):
        await prefs.setStringList(key, value);
        break;
      default:
        await prefs.setString(key, value.toString());
        break;
    }
  }

  static Future<dynamic> getData<T>(String key, T type) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    
    switch(type.runtimeType) {
      case const (String):
        return prefs.getString(key);
      case const (int):
        return prefs.getInt(key);
      case const (double):
        return prefs.getDouble(key);
      case const (bool):
        return prefs.getBool(key);
      case const (List<String>):
        return prefs.getStringList(key);
      default:
        return prefs.getString(key);
    }
  }

  static Future<bool> clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }
}