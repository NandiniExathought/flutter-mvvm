import 'package:country_state/view_models/dropdown_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: ((context) => DropdownViewModel()), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: dropDownWidgets(context),
    );
  }

  Widget dropDownWidgets(BuildContext context) {
    DropdownViewModel model = Provider.of<DropdownViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Country State Selector'),
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
              value: model.country,
              onChanged: model.handleChangeForCountry,
              items: model.countryStateMap.keys
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
              value: model.state,
              onChanged: model.handleChangeForState,
              items: model.countryStateMap[model.country]
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
