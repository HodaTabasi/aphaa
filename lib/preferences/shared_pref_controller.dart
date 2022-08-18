
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { loggedIn, id, name, email, lang }

class SharedPrefController {
  SharedPrefController._internal();

  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._internal();
  }

  ///TO BE CALLED IN main() after WidgetsFlutterBinding.ensureInitialized()
  ///and Before runApp(widget);
  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Future<void> save({required User user}) async {
  //   await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
  //   await _sharedPreferences.setInt(PrefKeys.id.name, user.id);
  //   await _sharedPreferences.setString(PrefKeys.name.name, user.name);
  //   await _sharedPreferences.setString(PrefKeys.email.name, user.email);
  // }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.name) ?? false;

  T? getValueFor<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> changeLanguage({required String language}) async {
    return _sharedPreferences.setString(PrefKeys.lang.name, language);
  }

  Future<bool> removeValueFor({required String key}) async {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PrefKeys.loggedIn.name);
    _sharedPreferences.remove(PrefKeys.email.name);

    // _sharedPreferences.setBool(PrefKeys.loggedIn.name, false);
  }

  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }
}

// class Shape {
//   factory Shape() {
//     return Circle();
//   }
// }
//
// class Circle extends Shape {}
