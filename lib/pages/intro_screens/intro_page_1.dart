import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/Vector4.png",
                width: screenwidth,
                height: screenheight / 1.3,
                fit: BoxFit.cover,
              ),

              // me image eka
              Positioned(
                  top: 250,
                  left: screenwidth / 2 - 150,
                  child: Image.asset(
                    "assets/onboard1.png",
                    scale: 1.1,
                  ))
            ],
          ),
          const Text("REUSE",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w700,
              )),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              "Utilise the product in different way possible",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
