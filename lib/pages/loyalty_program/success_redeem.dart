import 'package:flutter/material.dart';
import 'package:plustik/pages/home_page.dart';

class SuccessPage extends StatefulWidget {
  final int points;

  SuccessPage({required this.points});

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 15),
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
                CircleAvatar(
                    radius: 60,
                    backgroundColor: const Color.fromARGB(255, 195, 248, 223),
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
                    )),
              ],
            ),
            const SizedBox(height: 5),
            Image.asset("assets/success.jpg", scale: 1.9),
            const SizedBox(height: 5),
            const Text(
              'Congratulations!',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "You've redeemed 10 points. Thank you for your loyalty and commitment to responsible waste disposal!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16.5, color: Color.fromARGB(135, 0, 0, 0)),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff00B140),
                padding:
                    const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
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
