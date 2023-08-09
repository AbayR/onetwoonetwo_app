import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_countries')) {
        try {
          _countries = jsonDecode(prefs.getString('ff_countries') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _password = prefs.getInt('ff_password') ?? _password;
    });
    _safeInit(() {
      _email = prefs.getString('ff_email') ?? _email;
    });
    _safeInit(() {
      _searchHistory = prefs
              .getStringList('ff_searchHistory')
              ?.map((x) {
                try {
                  return SearchHistoryStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _searchHistory;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _countries = jsonDecode('0');
  dynamic get countries => _countries;
  set countries(dynamic _value) {
    _countries = _value;
    prefs.setString('ff_countries', jsonEncode(_value));
  }

  int _password = 0;
  int get password => _password;
  set password(int _value) {
    _password = _value;
    prefs.setInt('ff_password', _value);
  }

  String _email = '';
  String get email => _email;
  set email(String _value) {
    _email = _value;
    prefs.setString('ff_email', _value);
  }

  int _OTP = 0;
  int get OTP => _OTP;
  set OTP(int _value) {
    _OTP = _value;
  }

  List<SearchHistoryStruct> _searchHistory = [];
  List<SearchHistoryStruct> get searchHistory => _searchHistory;
  set searchHistory(List<SearchHistoryStruct> _value) {
    _searchHistory = _value;
    prefs.setStringList(
        'ff_searchHistory', _value.map((x) => x.serialize()).toList());
  }

  void addToSearchHistory(SearchHistoryStruct _value) {
    _searchHistory.add(_value);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.serialize()).toList());
  }

  void removeFromSearchHistory(SearchHistoryStruct _value) {
    _searchHistory.remove(_value);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromSearchHistory(int _index) {
    _searchHistory.removeAt(_index);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.serialize()).toList());
  }

  void updateSearchHistoryAtIndex(
    int _index,
    SearchHistoryStruct Function(SearchHistoryStruct) updateFn,
  ) {
    _searchHistory[_index] = updateFn(_searchHistory[_index]);
    prefs.setStringList(
        'ff_searchHistory', _searchHistory.map((x) => x.serialize()).toList());
  }

  bool _userloggedIn = false;
  bool get userloggedIn => _userloggedIn;
  set userloggedIn(bool _value) {
    _userloggedIn = _value;
  }

  String _lineBreak = '';
  String get lineBreak => _lineBreak;
  set lineBreak(String _value) {
    _lineBreak = _value;
  }

  final _myCoursesManager = StreamRequestManager<List<CoursesRecord>>();
  Stream<List<CoursesRecord>> myCourses({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CoursesRecord>> Function() requestFn,
  }) =>
      _myCoursesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyCoursesCache() => _myCoursesManager.clear();
  void clearMyCoursesCacheKey(String? uniqueKey) =>
      _myCoursesManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
