import 'package:flutter/material.dart';

class MakeAppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make Appointments'),
        backgroundColor: Color(0xff00B140), // Green background color for the app bar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              Text(
                'Make your Appointment',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                       // Page number indicator
        
                      // Form fields for Date, Time, and Contact Number
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Date'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Time'),
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Contact Number'),
                      ),
                      SizedBox(height: 20),
                      Text('Page 1 of 2'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Cancel button action
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Next button action
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
