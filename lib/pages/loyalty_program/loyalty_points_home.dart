import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plustik/pages/loyalty_program/calculate_points.dart';

class LoyaltyPointsPage extends StatefulWidget {
  const LoyaltyPointsPage({super.key});


  @override
  _LoyaltyPointsPageState createState() => _LoyaltyPointsPageState();

}

class _LoyaltyPointsPageState extends State<LoyaltyPointsPage> {
  int loyaltyPoints = 100;
  final int freePoints = 50;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/personHome.png", scale: 1.45),
                  const SizedBox(width: 10),
                  Text("Hi ${user!.email?.split('@')[0] ?? 'No Email'}"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 226, 234, 228)),
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 195, 248, 223),
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text('Loyalty Points',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      '$loyaltyPoints', // Show the current loyalty points
                                  style: TextStyle(
                                    fontSize: 40,
                                  ),
                                ),
                                TextSpan(
                                  text: ' pts',
                                  style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Earn more points and Enjoy exclusive benefits',
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Image.asset(
                          "assets/gift.png",
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(40),
                      color:
                          Color.fromARGB(255, 255, 255, 255).withOpacity(0.2),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Aligns the text to the left
                          children: [
                            Text('Free $freePoints Points',
                                style: TextStyle(
                                    fontSize: 14.0, color: Colors.black)),
                            SizedBox(height: 1),
                            Text('Time Remaining 07:45:02',
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey)),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              loyaltyPoints += freePoints;
                            });
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  backgroundColor: Colors.white,
                                  title: Center(
                                    child: Text(
                                      "Congratulations!",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  content: Text(
                                    "You have claimed $freePoints points",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text(
                                        "Close",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 255, 255),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          child: const Text(
                            'Claim',
                            style: TextStyle(fontSize: 16, color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: _buildSection(
                  ('assets/image0.jpg'),
                  "Glass",
                  "Recycle glass bottles and containers",
                  "03 Points for 1kg (1 Kilo)"),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: _buildSection(
                  "assets/image1.jpg",
                  "Paper",
                  "Recycle newspapers,  magazines, and cardboard",
                  "04 Points for 1kg (1 Kilo)"),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: _buildSection(
                  "assets/image2.jpg",
                  "Plastic",
                  "Recycle plastic bottles and containers",
                  "03 Points for 1kg (1 Kilo)"),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: _buildSection(
                  "assets/image3.jpg",
                  "Organic",
                  "Compost food scraps and organic waste",
                  "05 Points for 1kg (1 Kilo)"),
            ),
            SizedBox(height: 8),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CalculatePointsPage(
                            loyaltyPoints: loyaltyPoints,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 126, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      minimumSize: Size(200, 50),
                    ),
                    child: const Text('Earn Points',
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
      String imagePath, String heading, String description, String lastLine) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage(imagePath),
        ),
        SizedBox(width: 32),
        Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.circular(20),
          ),
          constraints: BoxConstraints(
            maxWidth: 230,
            minHeight: 50,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(heading,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
              Text(description,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w100)),
              Text(lastLine,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
            ],
          ),
        )
      ],
    );
  }
}
