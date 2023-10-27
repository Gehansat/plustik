import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plustik/pages/appointments/wastecollectionUI.dart';
import 'package:plustik/pages/myevents/event_calender.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                Image.asset("assets/user.png", scale: 12),

                Text("You logged in as ${user!.email}"),

                IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: signUserOut
                ),
              ],
            ),
            const SizedBox(height: 30),
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
                        "Earn points for\ndiscarded\ntrash",
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
                      CupertinoPageRoute(builder: (ctx) => const EventCalenderPage()),
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
            Container(
              width: screenwidth * 0.8,
              height: screenheight * 0.15,
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Center(
                child: Text("Buy a package",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
