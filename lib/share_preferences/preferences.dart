import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  //! late
  static late SharedPreferences _prefs;

  static String _name = 'name';
  static bool _isDarkMode = false;
  static int _gender = 1;

  //! entodo momento despues de haber llamado el init method puede acceder a las propiedades creadas anteriormente
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static String get name {
    return _prefs.getString('name') ?? _name;
  }

  static set name(String value) {
    _name = value;
    _prefs.setString('name', _name);
  }

  static bool get isDarkMode {
    return _prefs.getBool('isDarkMode') ?? _isDarkMode;
  }

  static set isDarkMode(bool value) {
    _isDarkMode = value;
    _prefs.setBool('isDarkMode', _isDarkMode);
  }

  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender(int value) {
    _gender = value;
    _prefs.setInt('gender', _gender);
  }
}
