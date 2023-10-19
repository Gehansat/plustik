import 'package:intl/intl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plustik/models/appointmentmodel.dart';
import 'package:plustik/pages/appointments/appointmenttwo.dart';

class MakeAppointmentsPage extends StatefulWidget {
  @override
  _MakeAppointmentsPageState createState() => _MakeAppointmentsPageState();
}

class _MakeAppointmentsPageState extends State<MakeAppointmentsPage> {
  final _formKey = GlobalKey<FormState>();
  final _databaseReference = FirebaseDatabase.instance.reference();

  String date = '';
  String time = '';
  String contactNo = '';
  String email = '';
  String instructions = '';
  List<String> wasteTypes = [];

  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void insertAppointmentData() {
    if (_formKey.currentState!.validate() && selectedDate != null) {
      final appointment = Appointment(
        date: DateTime.parse(date),
  time: DateTime.parse(time),
        contactNo: contactNo,
        email: email,
        instructions: instructions,
        wasteTypes: wasteTypes,
      );

      _databaseReference.child('appointments').push().set(appointment.toJson());

      Navigator.of(context).push(
        CupertinoPageRoute(builder: (ctx) => AppointmenttwoDetailsPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Make Appointments'),
        backgroundColor: Color(0xff00B140),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                Center(
                  child: Image.asset(
                    "assets/logo.png",
                    scale: 1.2,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Make your Appointment',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                ),),
                SizedBox(height: 20),
                Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            _selectDate(context); // Trigger the date picker when tapped
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'Date'),
                              controller: TextEditingController(
                                text: selectedDate == null
                                    ? 'Select Date'
                                    : DateFormat('dd/MM/yyyy').format(selectedDate!),
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Time'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a time';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            time = value!;
                          },
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Contact Number'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a contact number';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            contactNo = value!;
                          },
                        ),
                        SizedBox(height: 20),
                        Text('1 / 2'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: insertAppointmentData,
                  child: Container(
                    width: screenWidth * 0.1,
                    height: screenHeight * 0.08,
                    decoration: BoxDecoration(
                      color: Color(0xff00B140),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
