import 'package:flutter/material.dart';

class DisplayNotify extends StatelessWidget {
  const DisplayNotify({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:Center(
        child:Column(
          children: [
            const SizedBox(height: 40),
          
            const SizedBox(height: 60),
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
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "We are coming soon!",
                        style: TextStyle(
                          fontSize: 23.0,
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
                        "assets/notify.png",
                        width:70,
                        height:70,
                        scale: 0.9,
                      ),
                    ),
                  ),
                ],
              ),

            ),

        ],
        
        )
      )
    );
  }
}