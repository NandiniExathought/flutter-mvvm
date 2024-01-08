import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DropDownWidget(
        title: 'Country State Selector',
      ),
    );
  }
}

class DropDownWidget extends StatefulWidget {
  final String title;
  const DropDownWidget({super.key, required this.title});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  static String? _country;
  static String? _state;

  Map<String, List<String>> countryStateMap = {
    'India': ['Karnataka', 'Kerala', 'TamilNadu'],
    'USA': ['US1', 'US2']
  };
  @override
  void initState() {
    super.initState();
    _country = countryStateMap.keys.toList()[0];
    _state = countryStateMap[_country]?[0];

  }

  void handleChangeForCountry(String? newValue) {
    setState(() {
      _country = newValue!;
      _state = countryStateMap[_country]?[0];
    });
  }

  void handleChangeForState(String? newValue) {
                setState(() {
                  _state = newValue;
                });
              }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Country',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _country,
              onChanged: handleChangeForCountry,
              items: countryStateMap.keys
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            const Text(
              'State',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _state,
              onChanged: handleChangeForState,
              items: countryStateMap[_country]
                  ?.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}


