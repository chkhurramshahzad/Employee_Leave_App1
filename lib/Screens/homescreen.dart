// ignore_for_file: unused_element

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:leave_app/DatabaseManager/DatabaseManager.dart';
import 'package:leave_app/Screens/Login.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<FirebaseApp> _initializedfirebase() async{
    FirebaseApp firebaseApp= await  Firebase.initializeApp();
    return firebaseApp;
  }
  CollectionReference users = FirebaseFirestore.instance.collection('leaves');
  List userProfilesList = [];

  String userID = "";

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getUsersList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(300, 10, 0, 15),
              child: CircleAvatar(
                child: Image(
                  image: AssetImage('./assets/Profile_Image.png'),
                ),
                backgroundColor: Color.fromARGB(255, 0, 75, 136),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Leaves",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'Date',
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
            StreamBuilder<Object>(
                stream: users.snapshots().asBroadcastStream(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Column(
                      children: [
                        SizedBox(
                          child: ListView.builder(
                              itemCount: userProfilesList.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    title: Text(
                                        userProfilesList[index]['endDate']),
                                    subtitle: Text(
                                        userProfilesList[index]['startDate']),
                                    leading: Text(
                                        userProfilesList[index]['userName']),
                                    trailing:
                                        Text(userProfilesList[index]['reason']),
                                  ),
                                );
                              }),
                        ),
                      ],
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}

