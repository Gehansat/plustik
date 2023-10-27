import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

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

  Future<void> _selectDate() async {
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

  Future<void> _selectTime() async {
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
                  'Add an Event',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              // EVENT NAME ==================================================
              TextFormField(
                controller: eventNameController,
                decoration: InputDecoration(
                  labelText: 'Event Name',
                  hintText: 'Enter the event name', // Placeholder text
                  prefixIcon: Icon(Icons.event), // Icon before the input field
                  border: OutlineInputBorder( // Custom border
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder( // Custom border when the field is focused
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder( // Custom border for validation errors
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                  // You can add more properties like contentPadding, labelStyle, and more here
                ),
                style: TextStyle( // Text style for the input text
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an event name';
                  }
                  return null;
                },
              ),

              // DATE =========================================================================
              const SizedBox(height: 15),
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(
                  labelText: 'Date',
                  hintText: 'YYYY-MM-DD',
                  prefixIcon: Icon(Icons.calendar_today), // Icon before the input field
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                onTap: _selectDate,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),

              // TIME =========================================================================
              const SizedBox(height: 15),
              TextFormField(
                controller: timeController,
                decoration: InputDecoration(
                  labelText: 'Time',
                  hintText: 'HH:MM',
                  prefixIcon: Icon(Icons.access_time), // Icon before the input field
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                onTap: _selectTime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a time';
                  }
                  return null;
                },
              ),

              // VENUE =========================================================================
              const SizedBox(height: 15),
              TextFormField(
                controller: venueController,
                decoration: InputDecoration(
                  labelText: 'Venue',
                  prefixIcon: Icon(Icons.location_on), // Icon before the input field
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a venue';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // CATEGORY ======================================================================
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black26, // Border color
                    width: 1.3, // Border width
                  ),
                  borderRadius: BorderRadius.circular(10.0,), // Border radius
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 6, 15, 6),
                  child: DropdownButton<String>(
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
                ),
              ),
              const SizedBox(height: 40),

              // ADD EVENT BUTTON ===============================================================
              ElevatedButton(

                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff00B140),
                  onPrimary: Colors.white,
                  minimumSize: const Size(80, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await addEventToFirebase();
                  }
                },
                child: Text('Add Event'),
              ),

              // Horizontal Line ===================================================================
              // const SizedBox(height: 40),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Container(
              //       width: 80, // Adjust the width of the first horizontal line
              //       height: 1, // Adjust the height of the first horizontal line
              //       color: Colors.black38, // Color of the first horizontal line
              //     ),
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 8), // Add space between the lines and text
              //       child: Text(
              //         'Love from PLUSTIK',
              //         style: TextStyle(
              //           fontSize: 14, // Text size
              //           color: Colors.black38, // Text color
              //           fontWeight: FontWeight.normal, // Text font weight
              //         ),
              //       ),
              //     ),
              //     Container(
              //       width: 80, // Adjust the width of the second horizontal line
              //       height: 1, // Adjust the height of the second horizontal line
              //       color: Colors.black38, // Color of the second horizontal line
              //     ),
              //   ],
              // ),

          // Thank You Text ===================================================================
          const SizedBox(height: 70),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Thank you for your valuable contribution to ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black38,
                      ),
                    ),
                    TextSpan(
                      text: 'PLUSTIK community',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff00B140), // Apply custom styles
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: '. Your contribution enhances our platform and is deeply appreciated. ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black38,
                      ),
                    ),
                    WidgetSpan(
                      child: Icon(CupertinoIcons.suit_heart, size: 18, color: Color(0xff00B140)),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
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
      const SnackBar(
        backgroundColor: Color(0xff00B140),
        content: Text('Event added successfully',
        style: TextStyle(
          fontSize: 17,
          // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
