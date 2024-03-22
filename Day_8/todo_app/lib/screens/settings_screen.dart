import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../providers/app_setting_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _sortByTitleAsc = false;
  bool _sortByTitleDesc = false;
  bool _sortByDeadlineEarly = false;
  bool _sortByDeadlineLatest = false;
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _sortByTitleAsc = _prefs.getBool('sortByTitleAsc')!;
      _sortByTitleDesc = _prefs.getBool('sortByTitleDesc')!;
      _sortByDeadlineEarly = _prefs.getBool('sortByDeadlineEarly')!;
      _sortByDeadlineLatest = _prefs.getBool('sortByDeadlineLatest')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    final appSettings = Provider.of<AppSettings>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sort todo by title (A-Z)",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: appSettings.sortByTitleAsc,
                    activeColor: Colors.blue,
                    activeTrackColor: Colors.yellow,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.white54,
                    onChanged: (value) {
                      appSettings.setSortByTitleAsc(value);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sort todo by title (Z-A)",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: appSettings.sortByTitleDesc,
                    activeColor: Colors.blue,
                    activeTrackColor: Colors.yellow,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.white54,
                    onChanged: (value) {
                      appSettings.setSortByTitleDesc(value);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sort todo by deadline (Early)",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: appSettings.sortByDeadlineEarly,
                    activeColor: Colors.blue,
                    activeTrackColor: Colors.yellow,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.white54,
                    onChanged: (value) {
                      appSettings.setSortByDeadlineEarly(value);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sort todo by deadline (Latest)",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: appSettings.sortByDeadlineLatest,
                    activeColor: Colors.blue,
                    activeTrackColor: Colors.yellow,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.white54,
                    onChanged: (value) {
                      appSettings.setSortByDeadlineLatest(value);
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {
                    Navigator.pop(context);
                  }, child: const Text('Back to list', style: TextStyle(color: Colors.blue),))
                ],
              )
            ],
          ),
        ));
  }
}
