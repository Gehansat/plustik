import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plustik/pages/appointments/listappointments.dart';

class Successpage extends StatelessWidget {
  final String date; // Add date parameter to get from the database
  final String time; // Add time parameter to get from the database

  Successpage({Key? key, required this.date, required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Date: $date');
    print('Time: $time');
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Success Page'),
      //   backgroundColor: const Color(0xff00B140),
      // ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align content at the center and space evenly
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 20), // Add some space at the top
                // Image.asset(
                //   'assets/logo.png', // Your logo image asset
                //   // height: 150,
                //   scale: 1.5,
                // ),
                const SizedBox(height: 150),
                Image.asset(
                  'assets/success.png', // Your success image asset
                  height: 100,
                ),
                const SizedBox(height: 50),
                const Text(
                  'Your appointment has been\nsuccessfully scheduled.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  'We look forward to seeing you,',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  'on $date',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                  ), // Make the date bold
                      textAlign: TextAlign.center,
                  ),
                // Text(
                //   '',
                //   style: const TextStyle(fontSize: 16),
                //   textAlign: TextAlign.center,
                // ),
                Text(
                  'at $time',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold), // Make the time bold
                  textAlign: TextAlign.center,
                ),
                Text(
                  ' at Malabe.',
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: () {
                // Navigate to the HomePage
                Navigator.of(context).push(
                  CupertinoPageRoute(builder: (ctx) => AppointmentsListPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff00B140), // Background color
                minimumSize: const Size(130, 50),
              ),
              child: const Text('Done'),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
