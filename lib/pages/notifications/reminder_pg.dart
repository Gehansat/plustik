import 'package:flutter/material.dart';

class ReminderPage extends StatelessWidget {
  const ReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:Center(
        child:Column(
          children: [
            const SizedBox(height: 90),
            Container(
              width: screenwidth * 0.8,
              height: screenheight * 0.45,
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Reminders on!",
                        style: TextStyle(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 90.0, left: 16.0, right: 16.0),
                          child: Text(
                            "\nStay ahead with\nFriendly Reminders",
                            style: TextStyle(
                             fontSize: 18.0, // Adjust the font size as per your requirement
                              fontWeight: FontWeight.bold,
                          ),
                       ),
                      ),
                    ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        "assets/tikrounded.png",
                        width:70,
                        height:70,
                        scale: 0.9,
                      ),
                    ),
                  ),
                ],
              ),

            ),
            const SizedBox(height: 60),
           Container(
                    width: screenwidth * 0.8,
                    height: screenheight * 0.08,
                    decoration: BoxDecoration(
                      color: const Color(0xff00B140),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text("Done",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
          ],

        )
      )

    );
  }
}