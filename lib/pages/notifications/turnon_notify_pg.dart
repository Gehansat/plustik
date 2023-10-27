import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:plustik/pages/notifications/notify_type_pg.dart';
import 'package:plustik/pages/notifications/reminder_pg.dart';

import 'display_notify_pg.dart';

class TurnNotify extends StatelessWidget {
  TurnNotify({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Image.asset("assets/user.png", scale: 15),

            // Text("Hi Dew"),

            // IconButton(
            //     icon: const Icon(Icons.logout),
            //     onPressed: signUserOut
            // ),
          ],
        ),
        const SizedBox(height: 80),
        Container(
          width: screenwidth * 0.8,
          height: screenheight * 0.45,
          decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "Get notified\nGet prepared",
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
        const SizedBox(height: 60),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 25,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                CupertinoPageRoute(builder: (ctx) => const NotifyTypePage()),
              ),
              child: Container(
                width: screenwidth * 0.4,
                height: screenheight * 0.10,
                decoration: BoxDecoration(
                  color: const Color(0xff00B140),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    "Notifications",
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
                  CupertinoPageRoute(builder: (ctx) => const ReminderPage()),
                );
              },
              child: Container(
                width: screenwidth * 0.4,
                height: screenheight * 0.10,
                decoration: BoxDecoration(
                  color: const Color(0xff00B140),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Center(
                  child: Text(
                    "Reminders",
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
            const SizedBox(
              width: 25,
            ),
          ],
        ),
        const SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              CupertinoPageRoute(builder: (ctx) => const DisplayNotify()),
            );
          },
          child: Container(
            width: screenwidth * 0.81,
            height: screenheight * 0.10,
            decoration: BoxDecoration(
              color: const Color(0xff00B140),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Center(
              child: Text(
                "View",
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
    )));
  }
}
