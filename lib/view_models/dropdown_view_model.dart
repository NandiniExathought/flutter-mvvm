import 'package:flutter/material.dart';

class DropdownViewModel extends ChangeNotifier {
  Map<String, List<String>> countryStateMap = {
    'India': ['Karnataka', 'Kerala', 'TamilNadu'],
    'USA': ['US1', 'US2']
  };

  String? _country;
  String? _state;

  DropdownViewModel() {
    _country = countryStateMap.keys.toList()[0];
    _state = countryStateMap[_country]?[0];
  }

  String? get country => _country;
  String? get state => _state;

  void handleChangeForCountry(String? newValue) {
    _country = newValue!;
    _state = countryStateMap[_country]?[0];
    notifyListeners();
  }

  void handleChangeForState(String? newValue) {
    _state = newValue;
    notifyListeners();
  }
}
