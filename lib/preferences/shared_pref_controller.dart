import 'dart:convert';

import 'package:aphaa_app/model/Patient.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/Eligibility.dart';

enum PrefKeys { loggedIn, id, name, email, lang ,isFirstLancsh}

enum PrefKeysPatient {
  id,
  firstName,
  secondName,
  thirdName,
  lastName,
  identityNumber,
  mobile,
  email,
  patientType,
  payingType,
  insuranceNumber,
  insuranceDate,
  insuranceName,
  isLoggedIn,
  token
}

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
  Future<void> saveEligibility({required Eligibility eligibility}) async {
    // Map json = jsonDecode(jsonString);
    String egt = jsonEncode(eligibility.toJson());
    _sharedPreferences.setString('eligibility', egt);
   }
  Eligibility getEligibility()  {
    Map<String,dynamic> json = jsonDecode(_sharedPreferences.getString('eligibility')??'');
    Eligibility eligibility = Eligibility.fromJson(json);
    return eligibility;
  }

  // Future<void> save({required Patient student}) async {
  //   await _sharedPreferences.setBool(PrefKeysPatient.isLoggedIn.name, true);
  //   await _sharedPreferences.setInt(PrefKeysPatient.id.name, student.id??0);
  //   await _sharedPreferences.setString(PrefKeysPatient.firstName.name, student.firstName??"");
  //   await _sharedPreferences.setString(PrefKeysPatient.secondName.name, student.secondName??"");
  //   await _sharedPreferences.setString(PrefKeysPatient.lastName.name, student.lastName??"");
  //   await _sharedPreferences.setString(PrefKeysPatient.email.name, student.email??"");
  //   await _sharedPreferences.setString(PrefKeysPatient.identityNumber.name, student.identityNumber??"");
  //   await _sharedPreferences.setString(PrefKeysPatient.insuranceDate.name, student.insuranceDate??"");
  //   await _sharedPreferences.setString(PrefKeysPatient.insuranceName.name, student.insuranceName??"");
  //   await _sharedPreferences.setString(PrefKeysPatient.insuranceNumber.name, student.insuranceNumber??"");
  //   await _sharedPreferences.setString(PrefKeysPatient.mobile.name, student.mobile??"");
  //   await _sharedPreferences.setString(
  //       PrefKeysPatient.token.name, 'Bearer ${student.token}');
  //   // await _sharedPreferences.setString(
  //   //     PrefKeys.refreshToken.name, 'Bearer ${student.refreshToken}');
  // }

  Future<void> save1(identityNumber ,mobile ) async {
    await _sharedPreferences.setBool(PrefKeysPatient.isLoggedIn.name, true);
     await _sharedPreferences.setString(PrefKeysPatient.identityNumber.name, identityNumber??"");
     await _sharedPreferences.setString(PrefKeysPatient.mobile.name, mobile??"");

    // await _sharedPreferences.setString(
    //     PrefKeys.refreshToken.name, 'Bearer ${student.refreshToken}');
  }

  Future<void> saveWithoutToken({required Patient student}) async {
    await _sharedPreferences.setBool(PrefKeysPatient.isLoggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeysPatient.id.name, student.id??0);
    await _sharedPreferences.setString(PrefKeysPatient.firstName.name, student.firstName??"");
    await _sharedPreferences.setString(PrefKeysPatient.secondName.name, student.secondName??"");
    await _sharedPreferences.setString(PrefKeysPatient.lastName.name, student.lastName??"");
    await _sharedPreferences.setString(PrefKeysPatient.email.name, student.email??"");
    await _sharedPreferences.setString(PrefKeysPatient.identityNumber.name, student.identityNumber??"");
    await _sharedPreferences.setString(PrefKeysPatient.insuranceDate.name, student.insuranceDate??"");
    await _sharedPreferences.setString(PrefKeysPatient.insuranceName.name, student.insuranceName??"");
    await _sharedPreferences.setString(PrefKeysPatient.insuranceNumber.name, student.insuranceNumber??"");

    // await _sharedPreferences.setString(
    //     PrefKeys.refreshToken.name, 'Bearer ${student.refreshToken}');
  }

  saveName(firstName,lastName,pid) async {
    await _sharedPreferences.setString(PrefKeysPatient.firstName.name, firstName??"");
    await _sharedPreferences.setString(PrefKeysPatient.lastName.name, lastName??"");
    await _sharedPreferences.setString(PrefKeysPatient.identityNumber.name, pid??"");

  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.name) ?? false;

  Future<void> setfirstLanch(value) async {
    await _sharedPreferences.setBool(PrefKeys.isFirstLancsh.name,value);
  }

  bool get isFirstLancsh =>
      _sharedPreferences.getBool(PrefKeys.isFirstLancsh.name) ?? false;

  T? getValueFor<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  setValuePCode({required String pCode}) async {
    await _sharedPreferences.setString("p_code", pCode);
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

  String get token => _sharedPreferences.getString(PrefKeysPatient.token.name) ?? '';

  String get password => _sharedPreferences.getString("password") ?? '';
  void setPassword(password) {
    _sharedPreferences.setString("password",password);
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PrefKeysPatient.isLoggedIn.name);
    _sharedPreferences.remove(PrefKeysPatient.email.name);

    // _sharedPreferences.setBool(PrefKeys.loggedIn.name, false);
  }

  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }

  // saveMedicalId(id) async {
  //   await _sharedPreferences.setString("medicalId",id );
  // }
}

// class Shape {
//   factory Shape() {
//     return Circle();
//   }
// }
//
// class Circle extends Shape {}
