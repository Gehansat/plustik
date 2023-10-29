import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:plustik/pages/appointments/wastecollectionUI.dart';
import 'package:plustik/pages/loyalty_program/loyalty_points_home.dart';

import 'package:plustik/pages/myevents/event_calender.dart';
import 'package:plustik/pages/notifications/notify_type_pg.dart';
import 'package:plustik/pages/notifications/turnon_notify_pg.dart';
import 'package:plustik/pages/preferences_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loyalty_program/packages.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  
  final user = FirebaseAuth.instance.currentUser;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Upper part of the screen | Profile picture and name | Logout button ==========
            Padding(
              padding: const EdgeInsets.fromLTRB(45, 15, 30, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(builder: (ctx) => TurnNotify()),
                      );
                    },
                    child: Image.asset("assets/personHome.png", scale: 1.4),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text("Hi ${user?.email?.split('@')[0] ?? 'No Email'}",
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout,
                      color: Colors.black54,
                    ),
                    onPressed: signUserOut,

                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            GestureDetector(
              onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (ctx) => const LoyaltyPointsPage()),
                // CupertinoPageRoute(builder: (ctx) => const PackagePage()),
              );
            },
              child: Container(
                width: screenwidth * 0.8,
                height: screenheight * 0.45,
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(10.0),
                  // border: Border.all(
                  //   color: const Color(0xff00B140),
                  //   width: 2.0,
                  // ),
                ),

                child: Stack(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Earn points for\ndiscarded\ntrash",
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
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
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 25,),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(builder: (ctx) => WasteCollectionUI()),
                    );
                  },
                  child: Container(
                    width: screenwidth * 0.4,
                    height: screenheight * 0.14,
                    decoration: BoxDecoration(
                      color: const Color(0xff00B140),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text("Appointments",
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      CupertinoPageRoute(builder: (ctx) => PreferencesScreen(user!)),
                    );
                  },
                  child: Container(
                    width: screenwidth * 0.4,
                    height: screenheight * 0.14,
                    decoration: BoxDecoration(
                      color: const Color(0xff00B140),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text("My Events",
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

                const SizedBox(width: 25,),
              ],
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (ctx) => const PackagePage()),
              );
            },
              child: Container(
                width: screenwidth * 0.8,
                height: screenheight * 0.15,
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: const Color(0xff00B140),
                    width: 2.0,
                  ),
                ),
                child: const Center(
                  child: Text("Buy a package",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff00B140),
                    ),
                  ),
                ),
              ),
            )

          ],
        )
      ),
    );
  }
}
