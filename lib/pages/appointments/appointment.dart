import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:plustik/pages/appointments/successpage.dart'; // Import for FontAwesome icons

class AddAppointmentPage extends StatefulWidget {
  @override
  _AddAppointmentPageState createState() => _AddAppointmentPageState();
}

class _AddAppointmentPageState extends State<AddAppointmentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController contactnoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController instructionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00B140),
        title: Text('Make Your Appointment'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    scale: 1.7,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Make Your Appointment',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        labelText: 'Date',
                        hintText: 'Date (YYYY-MM-DD)',
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // Add leading icon for the calendar
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a date';
                        }
                        if (!isValidDate(value)) {
                          return 'Invalid date format (YYYY-MM-DD)';
                        }
                        return null;
                      },
                      onTap: () {
                        _selectDate(context);
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: timeController,
                      decoration: InputDecoration(
                        labelText: 'Time',
                        hintText: 'Time (HH:MM)',
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // Add leading icon for the clock
                        prefixIcon: Icon(Icons.access_time),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a time';
                        }
                        if (!isValidTime(value)) {
                          return 'Invalid time format (HH:MM)';
                        }
                        return null;
                      },
                      onTap: () {
                        _selectTime(context);
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: contactnoController,
                      decoration: InputDecoration(
                        labelText: 'Contact Number',
                        hintText: 'Contact Number',
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a contact number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email';
                        }
                        if (!isValidEmail(value)) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: instructionsController,
                      decoration: InputDecoration(
                        labelText: 'Instructions',
                        hintText: 'Instructions',
                        hintStyle: TextStyle(color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        // You can add custom validation for instructions here if needed.
                        return null; // No validation in this example.
                      },
                    ),
                    SizedBox(height: 16.0),
                    GestureDetector(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await addAppointmentDetailsToFirebase();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Successpage(
                                date: dateController.text,
                                time: timeController.text,
                              ),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: 200,
                        height: 40,
                        child: Card(
                          color: Color(0xff00B140),
                          elevation: 4,
                          child: Center(
                            child: Text(
                              'Confirm',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isValidDate(String value) {
    final pattern = r'^\d{4}-\d{2}-\d{2}$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  bool isValidTime(String value) {
  final pattern = r'^\d{1,2}:\d{2}\s[APap][Mm]$';
  final regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}


  bool isValidEmail(String value) {
    final pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)*(\.[a-z]{2,})$';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  Future<void> addAppointmentDetailsToFirebase() async {
    final appointmentDetailsCollection =
        FirebaseFirestore.instance.collection('AppointmentDetails');
    final details = AppointmentDetails(
      date: dateController.text,
      time: timeController.text,
      contactno: contactnoController.text,
      email: emailController.text,
      instructions: instructionsController.text,
    );

    await appointmentDetailsCollection.add(details.toMap());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Appointment Created Successfully'),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        timeController.text = picked.format(context);
      });
    }
  }
}

class AppointmentDetails {
  final String date;
  final String time;
  final String contactno;
  final String email;
  final String instructions;

  AppointmentDetails({
    required this.date,
    required this.time,
    required this.contactno,
    required this.email,
    required this.instructions,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'time': time,
      'contactno': contactno,
      'email': email,
      'instructions': instructions,
    };
  }
}
