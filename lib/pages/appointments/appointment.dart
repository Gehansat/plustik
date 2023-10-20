import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddAppointmentPage extends StatefulWidget {
  @override
  _AddAppointmentPage createState() => _AddAppointmentPage();
}

class _AddAppointmentPage extends State<AddAppointmentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController contactnoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController instructionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(30.0),

            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'Add an Appointment',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              
              const SizedBox(height: 15),
              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: 'Date',
                  hintText: 'YYYY-MM-DD',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: timeController,
                decoration: const InputDecoration(
                  labelText: 'Time',
                  hintText: 'HH:MM',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a time';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: contactnoController,
                decoration: InputDecoration(labelText: 'Contact no'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a Contact No';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 25),
              TextFormField(
                controller: instructionsController,
                decoration: InputDecoration(labelText: 'Instructions'),
              ),
              const SizedBox(height: 40),
              
              ElevatedButton(

                style: ElevatedButton.styleFrom(
                  primary: Color(0xff00B140),
                  onPrimary: Colors.white,
                  minimumSize: const Size(80, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                  ),
                ),
                onPressed: () async {
                  print("hello");
                  if (_formKey.currentState!.validate()) {
                    await addAppointmentToFirebase();
                  }
                  print("hello");
                },
                child: Text('Create Appointment'),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<void> addAppointmentToFirebase() async {
    final appointmentsCollection = FirebaseFirestore.instance.collection('Appointments');
    final appointmentsDateTime = DateTime.parse("${dateController.text} ${timeController.text}");
    await appointmentsCollection.add({
      'DateTime': appointmentsDateTime,
      'Contactno': contactnoController,
      'Email': emailController.text,
      'Instructions': instructionsController.text,
    });

    // Show a success message or navigate to another page
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Color(0xff00B140),
        content: Text('Appointment added successfully',
        style: TextStyle(
          fontSize: 17,
          // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
