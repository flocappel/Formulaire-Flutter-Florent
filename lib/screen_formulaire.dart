import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
class formulaire extends StatefulWidget {
  const formulaire({super.key});

  @override
  _formulaireState createState() => _formulaireState();
}

class _formulaireState extends State<formulaire> {
  final TextEditingController _emailController = TextEditingController();
  bool _isChecked = false;
  String _selectedRadio = '';
  bool _switchValue = false;
  double _sliderValue = 0.0;
  DateTime _selectedDate = DateTime.now();

  // ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              Checkbox(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              Row(
                children: [
                  Radio(
                    value: 'Option 1',
                    groupValue: _selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        _selectedRadio = value.toString();
                      });
                    },
                  ),
                  const Text('Option 1'),
                  Radio(
                    value: 'Option 2',
                    groupValue: _selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        _selectedRadio = value.toString();
                      });
                    },
                  ),
                  const Text('Option 2'),
                ],
              ),
              Switch(
                value: _switchValue,
                onChanged: (value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
              Slider(
                value: _sliderValue,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  DatePicker.showDatePicker(
                    context,
                    showTitleActions: true,
                    onConfirm: (date) {
                      setState(() {
                        _selectedDate = date;
                      });
                    },
                    currentTime: _selectedDate,
                  );
                },
                child: const Text('Select Date'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Valider le formulaire ici
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}