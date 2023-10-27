import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plustik/pages/appointments/appointment.dart';
import 'package:plustik/pages/appointments/listappointments.dart';

class WasteCollectionUI extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/user.png", scale: 12),
                Text("You logged in as ${user!.email}"),
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: screenWidth * 0.8,
              height: screenHeight * 0.45,
              decoration: BoxDecoration(
                color: Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Make new Appointment\nfor collect your\nGarbage",
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        "assets/mainlarge.png",
                        scale: 0.9,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                
                GestureDetector(
                  onTap: () {
                    // Navigate to the Appointments page
                    Navigator.of(context).push(
                      CupertinoPageRoute(builder: (ctx) => AppointmentsListPage()),
                    );
                  },
                  child: Container(
                    width: screenWidth * 0.38,
                    height: screenHeight * 0.10,
                    decoration: BoxDecoration(
                      color: Color(0xff00B140),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        "View Appointments",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),GestureDetector(
                  onTap: () {
                    // Navigate to the Appointments page
                    Navigator.of(context).push(
                      CupertinoPageRoute(builder: (ctx) => AddAppointmentPage()),
                    );
                  },
                  child: Container(
                    width: screenWidth * 0.38,
                    height: screenHeight * 0.10,
                    decoration: BoxDecoration(
                      color: Color(0xff00B140),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: Text(
                        "Make Appointment",
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
          ],
        ),
      ),
    );
  }
}

class Appointments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement your Appointments page here
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: Center(
        child: Text('This is the Appointments Page'),
      ),
    );
  }
}
