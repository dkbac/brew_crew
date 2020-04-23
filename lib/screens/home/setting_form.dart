import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';

class SettingForm extends StatefulWidget {
  @override
  _SettingFormState createState() => _SettingFormState();
}

class _SettingFormState extends State<SettingForm> {
  
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  // Form values
  String _currentName;
  String _currentSugar;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Text(
            'Bottom Sheets',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20.0,),
          TextFormField(
            decoration: inputTextDecoration.copyWith(hintText: 'Name'),
            validator: (val) => val.isEmpty ? 'Please enter a name!' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0,),
          // Dropdown
          DropdownButtonFormField(
            value: _currentSugar ?? '0',
            decoration: inputTextDecoration,
            items: sugars.map((sugar) {
              return DropdownMenuItem(
                value: sugar,
                child: Text('$sugar sugar(s)'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _currentSugar = val),
          ),
          // Slider
          Slider(
            value: (_currentStrength ?? 100).toDouble(),
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            min: 100,
            max: 900,
            divisions: 8,
            onChanged: (val) => setState(() => _currentStrength = val.round()),
          ),
          // Button
          RaisedButton(
            color: Colors.brown[900],
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_currentName);
              print(_currentSugar);
              print(_currentStrength);

            },
          ),
        ],
      ),
    );
  }
}