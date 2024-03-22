import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  bool _sortByTitleAsc = false;
  bool _sortByTitleDesc = false;
  bool _sortByDeadlineEarly = false;
  bool _sortByDeadlineLatest = false;
  late SharedPreferences _prefs;

  AppSettings() {
    _loadPreferences();
  }

  bool get sortByTitleAsc => _sortByTitleAsc;
  bool get sortByTitleDesc => _sortByTitleDesc;
  bool get sortByDeadlineEarly => _sortByDeadlineEarly;
  bool get sortByDeadlineLatest => _sortByDeadlineLatest;

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _sortByTitleAsc = _prefs.getBool('sortByTitleAsc') ?? false;
    _sortByTitleDesc = _prefs.getBool('sortByTitleDesc') ?? false;
    _sortByDeadlineEarly = _prefs.getBool('sortByDeadlineEarly') ?? false;
    _sortByDeadlineLatest = _prefs.getBool('sortByDeadlineLatest') ?? false;
    notifyListeners();
  }

  Future<void> _checkAndSavePreferences(String type, bool value) async {
    switch (type) {
      case 'asc':
        _sortByTitleDesc = false;
        _sortByDeadlineEarly = false;
        _sortByDeadlineLatest = false;
        break;
      case 'desc':
        _sortByTitleAsc = false;
        _sortByDeadlineEarly = false;
        _sortByDeadlineLatest = false;
        break;
      case 'early':
        _sortByTitleAsc = false;
        _sortByTitleDesc = false;
        _sortByDeadlineLatest = false;
        break;
      case 'latest':
        _sortByTitleAsc = false;
        _sortByTitleDesc = false;
        _sortByDeadlineEarly = false;
        break;
    }
    await _prefs.setBool('sortByTitleAsc', _sortByTitleAsc);
    await _prefs.setBool('sortByTitleDesc', _sortByTitleDesc);
    await _prefs.setBool('sortByDeadlineEarly', _sortByDeadlineEarly);
    await _prefs.setBool('sortByDeadlineLatest', _sortByDeadlineLatest);
    notifyListeners();
  }

  void setSortByTitleAsc(bool value) {
    _sortByTitleAsc = value;
    print('ASC');
    _checkAndSavePreferences('asc', value);
  }

  void setSortByTitleDesc(bool value) {
    print('DESC');
    _sortByTitleDesc = value;
    _checkAndSavePreferences('desc', value);
  }

  void setSortByDeadlineEarly(bool value) {
    print('EARLY');
    _sortByDeadlineEarly = value;
    _checkAndSavePreferences('early', value);
  }

  void setSortByDeadlineLatest(bool value) {
    print('LATEST');
    _sortByDeadlineLatest = value;
    _checkAndSavePreferences('latest', value);
  }
}
