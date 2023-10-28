import 'package:flutter/material.dart';
import 'package:plustik/pages/home_page.dart';
import 'package:plustik/pages/loyalty_program/success_redeem.dart';

class RedeemPage extends StatefulWidget {
  final int points;

  RedeemPage({required this.points});

  @override
  _RedeemPageState createState() => _RedeemPageState();
}

class _RedeemPageState extends State<RedeemPage> {
  late int updatedPoints;

  @override
  void initState() {
    super.initState();
    updatedPoints = widget.points;
  }

  void deductPointsAndNavigate() {
    setState(() {
      updatedPoints -= 10;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuccessPage(points: updatedPoints),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'Total Loyalty Points',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 19),
                CircleAvatar(
                    radius: 60,
                    backgroundColor: const Color.fromARGB(255, 195, 248, 223),
                    child: Center(
                        child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${widget.points}',
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
                    ))),
              ],
            ),
            SizedBox(height: 15),
            Container(
              width: 800,
              height: 250,
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
                        "Redeem\nLoyalty Points\nfor Rewards",
                        style: TextStyle(
                          fontSize: 22,
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
            SizedBox(height: 15),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Loyalty Points Redemption for Third Collection Onwards',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  'For your commitment to a cleaner environment by giving waste '),
                          TextSpan(
                              text: 'more than twice a week, ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(
                              text:
                                  'you can redeem your loyalty points for the '),
                          TextSpan(
                              text:
                                  'third collection onwards without any additional fee',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' from you.'),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        children: <TextSpan>[
                          TextSpan(text: 'To redeem points for a single day, '),
                          TextSpan(
                              text: '10 points',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: ' will be deducted.'),
                        ],
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: deductPointsAndNavigate,
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: const Text('Redeem Points',
                        style: TextStyle(fontSize: 16)),
                  ),
                  SizedBox(width: 180),
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(Icons.arrow_forward, size: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xffD9D9D9),
                padding:
                    const EdgeInsets.symmetric(horizontal: 119, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Back to Home', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
