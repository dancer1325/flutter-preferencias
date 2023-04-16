import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  // static     We want to have a singleton for this class
  // late       It's initialized asynchronously in shared_preferences library
  static late SharedPreferences _prefs;

  static String _name = '';
  static bool _isDarkmode = false;
  static int _gender = 1;

  // Constructor can't return a Future, since it's synchronous
  // Method which returns asynchronously the instance
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Getter & Setters to expose it
  // Read preferences, based on key
  // Write preferences, passing key and value
  static String get name {
    // https://www.geeksforgeeks.org/dart-null-aware-operators/
    return _prefs.getString('name') ?? _name;
  }

  static set name( String name ) {
    _name = name;
    _prefs.setString('name', name );
  }

  static bool get isDarkmode {
    return _prefs.getBool('isDarkmode') ?? _isDarkmode;
  }

  static set isDarkmode( bool value ) {
    _isDarkmode = value;
    _prefs.setBool('isDarkmode', value );
  }

  static int get gender {
    return _prefs.getInt('gender') ?? _gender;
  }

  static set gender( int value ) {
    _gender = value;
    _prefs.setInt('gender', value );
  }
}

