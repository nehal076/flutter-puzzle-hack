import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtils {
  static const _APP_PREF = "APP_PREF";
  static const _USER_PREF = "USER_PREF";

  static const _PLAYER_LEVEL = "playerLevel";
  static const _PLAYER_COMPLETED_LEVEL = "playerCompletedLevel";
  static const _VOLUME = "volume";

  static final SharedPrefUtils _instance = SharedPrefUtils._ctor();

  factory SharedPrefUtils() {
    return _instance;
  }

  SharedPrefUtils._ctor();

  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // APP_DATA functions

  static setAppStringValue(String key, String value) {
    final String? storedData =
        _prefs.containsKey(_APP_PREF) ? _prefs.getString(_APP_PREF)! : null;
    Map newData = {key: value};
    Map newDataMap = {};

    if (storedData != null) {
      newDataMap.addAll(jsonDecode(storedData));
      newDataMap.addAll(newData);
    } else {
      newDataMap = newData;
    }

    _prefs.setString(_APP_PREF, jsonEncode(newDataMap));
  }

  static String getAppStringValue(String key) {
    Map<String, dynamic> allPrefs =
        jsonDecode(_prefs.getString(_APP_PREF) ?? '');

    return allPrefs[key] ?? "";
  }

  static Map<String, dynamic> getAllAppPrefs() {
    Map<String, dynamic> allPrefs = _prefs.containsKey(_APP_PREF)
        ? jsonDecode(_prefs.getString(_APP_PREF)!)
        : {};
    return allPrefs;
  }

  // USER_DATA functions

  static setUserStringValue(String key, String value) {
    final String? storedData =
        _prefs.containsKey(_USER_PREF) ? _prefs.getString(_USER_PREF) : null;
    Map newData = {key: value};
    Map newDataMap = {};

    if (storedData != null) {
      newDataMap.addAll(jsonDecode(storedData));
      newDataMap.addAll(newData);
    } else {
      newDataMap = newData;
    }

    _prefs.setString(_USER_PREF, jsonEncode(newDataMap));
  }

  static String getUserStringValue(String key) {
    Map<String, dynamic> allPrefs = _prefs.getString(_USER_PREF) != null
        ? jsonDecode(_prefs.getString(_USER_PREF) ?? '')
        : {};
    return allPrefs[key] ?? '';
  }

  static Map<String, dynamic> getAllUserPrefs() {
    Map<String, dynamic> allPrefs = _prefs.containsKey(_USER_PREF)
        ? jsonDecode(_prefs.getString(_USER_PREF)!)
        : {};
    return allPrefs;
  }

  static removeValue(String key) {
    return _prefs.remove(key);
  }

  static String get playerLevel => getUserStringValue(_PLAYER_LEVEL);
  static String get playerCompletedLevel =>
      getUserStringValue(_PLAYER_COMPLETED_LEVEL);
  static String get volume => getUserStringValue(_VOLUME);

  static set playerLevel(String value) =>
      setUserStringValue(_PLAYER_LEVEL, value);

  static set volume(String value) => setUserStringValue(_VOLUME, value);
}

enum PrefType { APP_PREF, USER_PREF }

extension PrefExtension on PrefType {
  String get value {
    switch (this) {
      case PrefType.APP_PREF:
        return SharedPrefUtils._APP_PREF;
      case PrefType.USER_PREF:
        return SharedPrefUtils._USER_PREF;
    }
  }
}
