import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plustik/pages/appointments/appointmenttwo.dart';

class MakeAppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
              Center(
                child: Text(
                  'Make your Appointment',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Border radius here
                ),
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
                      Text('1 / 2'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
             
                  GestureDetector(
                  onTap: () {
                    // Navigate to the Appointments page
                    Navigator.of(context).push(
                      CupertinoPageRoute(builder: (ctx) => AppointmenttwoDetailsPage()),
                    );
                  },
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
    );
  }
}
