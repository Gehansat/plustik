import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:plustik/models//preference_model.dart'; // Import your model
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plustik/pages/myevents/event_calender.dart'; // Import Firebase Authentication

class PreferencesScreen extends StatefulWidget {
  final User user; // Firebase user

  PreferencesScreen(this.user);

  @override
  _PreferencesScreenState createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  PreferenceModel preferences = PreferenceModel();

  @override
  Widget build(BuildContext context) {
    // double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenheight * 0.12),
          Image.asset("assets/logo.png", scale: 1.4),
          SizedBox(height: screenheight * 0.03),
          const Center(
            child: Text(
              'Choose Your Preference',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: screenheight * 0.05),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: CheckboxListTile(
              title: Text('Global Events'),
              value: preferences.GlobEvents,
              activeColor: Color(0xff00B140),
              onChanged: (value) {
                setState(() {
                  preferences.GlobEvents = value!;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: CheckboxListTile(
              title: Text('Local Events'),
              activeColor: Color(0xff00B140),
              value: preferences.LocEvents,
              onChanged: (value) {
                setState(() {
                  preferences.LocEvents = value!;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: CheckboxListTile(
              title: Text('Shramadhana Campaigns'),
              activeColor: Color(0xff00B140),
              value: preferences.Shramadhana,
              onChanged: (value) {
                setState(() {
                  preferences.Shramadhana = value!;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: CheckboxListTile(
              title: Text('Workshops'),
              activeColor: Color(0xff00B140),
              value: preferences.Workshops,
              onChanged: (value) {
                setState(() {
                  preferences.Workshops = value!;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
            child: CheckboxListTile(
              title: Text('Recycling Programs'),
              activeColor: Color(0xff00B140),
              value: preferences.Recycling,
              onChanged: (value) {
                setState(() {
                  preferences.Recycling = value!;
                });
              },
            ),
          ),
          SizedBox(height: screenheight * 0.065),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: const Color(0xff00B140),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            onPressed: () async {
              // Store preferences in Firebase
              widget.user.updateProfile(displayName: "User", photoURL: null);
              final userPreferences = preferences.toJson();
              await FirebaseFirestore.instance.collection('users').doc(widget.user.uid).set({
                'UserID': widget.user.uid,
                'Preferences': userPreferences,
              });

              // Display success message
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Color(0xff00B140),
                  content: Text(
                    'Preferences saved successfully',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              );

              // Navigate to EventCalendarPage
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EventCalenderPage(),
                ),
              );
            },
            child: Text('Save Preferences'),
          ),
        ],
      ),
    );
  }
}
