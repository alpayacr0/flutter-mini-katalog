import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveUserData(String name, String surname) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', name);
    await prefs.setString('surname', surname);
  }

  Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();

    final name = prefs.getString('name');
    final surname = prefs.getString('surname');

    return {'name': name, 'surname': surname};
  }
}
