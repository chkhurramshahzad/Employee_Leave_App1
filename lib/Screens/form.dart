import 'package:date_time_picker/date_time_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({Key? key}) : super(key: key);
  @override
  State<CustomerForm> createState() => _CustomerFormState();
}

class _CustomerFormState extends State<CustomerForm> {
  final TextEditingController sampledata1= TextEditingController();
  final TextEditingController StartDate= TextEditingController();
  final TextEditingController EndDate= TextEditingController();
  final TextEditingController Description= TextEditingController();


  final items = ["Casual", "Sick", "Unpaid"];
  String? value;
  String _selectedGender = 'male';

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    var _formKey;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Submit a leave request",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                child: DropdownButton(
                  hint: const Text("Leave Type"),
                  value: value,
                  iconSize: 36,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                  ),
                  isExpanded: true,
                  items: items.map(buildMenuItem).toList(),
                  onChanged: (value) => this.value = value as String?,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'Start Date',
                icon: const Icon(Icons.event),
                selectableDayPredicate: (date) {
                  // Disable weekend days to select from the calendar
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }
                  return true;
                },
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'End Date',
                icon: const Icon(Icons.event),
                selectableDayPredicate: (date) {
                  // Disable weekend days to select from the calendar
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }
                  return true;
                },
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Half Day?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'First Half',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
              ),
              title: const Text('First Half'),
            ),
            ListTile(
              leading: Radio<String>(
                value: 'Second Half',
                groupValue: _selectedGender,
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value!;
                  });
                },
              ),
              title: const Text('Second Half'),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: FlatButton(
                onPressed: () {
                  Map<String,dynamic> data= {"field1":StartDate.text,"field2":EndDate.text, "field3":Description.text};
                  FirebaseFirestore.instance.collection("test").add(data);
                },
                padding: const EdgeInsets.all(8),
                child: const Text(
                  'SUBMIT',
                  style: TextStyle(fontSize: 16.0),
                ),
                color: const Color.fromARGB(255, 0, 75, 136),
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
