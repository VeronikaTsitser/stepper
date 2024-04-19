import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HumanCharacteristicsNotifier extends ChangeNotifier {
  int _userHeight = 170;
  int _stepGoal = 10000;
  late SharedPreferences _preferences;
  bool isInitialized = false;

  HumanCharacteristicsNotifier() {
    _init();
  }

  void _init() async {
    _preferences = await SharedPreferences.getInstance();
    _userHeight = _preferences.getInt('userHeight') ?? 170;
    _stepGoal = _preferences.getInt('stepGoal') ?? 10000;
    isInitialized = true;
    notifyListeners();
  }

  void setStepGoal(int goal) {
    _stepGoal = goal;
    _preferences.setInt('stepGoal', goal);
    notifyListeners();
  }

  int getStepGoal() {
    return _stepGoal;
  }

  void setUserHeight(int height) {
    _userHeight = height;
    _preferences.setInt('userHeight', height);
    notifyListeners();
  }

  int getUserHeight() {
    return _userHeight;
  }

  double calculateStepLength() {
    final stepLength = _userHeight * 0.415 / 100;
    log('Step length: $stepLength');
    return stepLength;
  }
}
