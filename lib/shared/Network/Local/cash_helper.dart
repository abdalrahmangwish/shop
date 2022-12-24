import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  // ignore: non_constant_identifier_names
  static Future<bool> PutData(
      {required String key, required bool value}) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getData({required String key}) {
    return sharedPreferences.getBool(key);
  }
}
