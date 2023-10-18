import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEventPage extends StatefulWidget {
  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController venueController = TextEditingController();
  String selectedCategory = 'Workshops'; // Default category

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: eventNameController,
              decoration: InputDecoration(labelText: 'Event Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an event name';
                }
                return null;
              },
            ),
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
              controller: venueController,
              decoration: InputDecoration(labelText: 'Venue'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a venue';
                }
                return null;
              },
            ),
            DropdownButton<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: <String>[
                'Workshops',
                'Global Events',
                'Local Events',
                'Shramadhana Campaigns',
                'Recycling Programs',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await addEventToFirebase();
                }
              },
              child: Text('Add Event'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addEventToFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // Handle the case where the user is not signed in
      print('User not signed in.');
      return;
    }

    final eventCollection = FirebaseFirestore.instance.collection('calendarevents');
    final eventDateTime = DateTime.parse("${dateController.text} ${timeController.text}");
    await eventCollection.add({
      'EventName': eventNameController.text,
      'DateTime': eventDateTime,
      'Venue': venueController.text,
      'Category': selectedCategory,
      'UserId': user.uid,
    });

    // Show a success message or navigate to another page
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Event added successfullyy'),
      ),
    );
  }
}
