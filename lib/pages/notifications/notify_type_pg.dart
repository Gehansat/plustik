import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:plustik/pages/notifications/display_notify_pg.dart';

import '../../models/notification_type_model.dart';

class NotifyTypePage extends StatefulWidget {
  const NotifyTypePage({Key? key}) : super(key: key);

  @override
  _NotifyTypePageState createState() => _NotifyTypePageState();
}

class _NotifyTypePageState extends State<NotifyTypePage> {
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;

  void _saveNotificationPreferences() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final notification = UserNotification(
        beforeTwoHours: _value1,
        beforeOneHour: _value2,
        beforeThirtyMinutes: _value3,
      );

      try {
        // Store notification preferences in Firebase Firestore
        await FirebaseFirestore.instance
            .collection('UserNotificationType')
            .doc(user.uid)
            .set(notification.toMap());

        // Show a success message using a snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color(0xff00B140),
            content: Text('Notification preferences saved successfully.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            duration: Duration(seconds: 2), // You can adjust the duration as needed.
          ),
        );
      } catch (error) {
        // Show an error message using a snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text('Failed to save notification preferences: $error',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 15),
          Image.asset("assets/logo.png", scale: 1.2),
          SizedBox(height: screenheight * 0.03),
          const Center(
            child: Text(
              'Select Notification Type',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: CheckboxListTile(
              title: Text('Before two hours'),
              value: _value1,
              onChanged: (bool? value) {
                setState(() {
                  _value1 = value!;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: CheckboxListTile(
              title: Text('Before one hour'),
              value: _value2,
              onChanged: (bool? value) {
                setState(() {
                  _value2 = value!;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: CheckboxListTile(
              title: Text('Before 30 minutes'),
              value: _value3,
              onChanged: (bool? value) {
                setState(() {
                  _value3 = value!;
                });
              },
            ),
          ),
          const SizedBox(height: 70),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff00B140),
              onPrimary: Colors.white,
              minimumSize: const Size(245, 65),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: _saveNotificationPreferences, // Call the save function
            child: Text('Save', style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 50),

          // GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).push(
          //       CupertinoPageRoute(builder: (ctx) => const DisplayNotify()),
          //     );
          //   },
          //   child: Container(
          //     width: screenwidth * 0.6,
          //     height: screenheight * 0.07,
          //     decoration: BoxDecoration(
          //       color: const Color(0xff00B140),
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //     child: const Center(
          //       child: Text(
          //         "View",
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontSize: 18.0,
          //           fontWeight: FontWeight.bold,
          //           color: Colors.white,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
