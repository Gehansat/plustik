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
            const SizedBox(height: 80),
            
            Container(
              width: screenwidth * 0.8,
              height: screenheight * 0.45,
              decoration: BoxDecoration(
                color: const Color(0xffF5F5F5),
                borderRadius: BorderRadius.circular(10.0),
              ),
              
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                                child: Image.asset(
                                  "assets/notify.png",
                                  width: 70,
                                  height: 70,
                                  scale: 0.9,
                                ),
                              ),
                          ),
                            const Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                  "Notifications!",
                                  style: TextStyle(
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.bold,
                                  ),
                                 ),
                                   ),
                            ),
                        ],
                  ),
                  
                    Text("This is your friendly neighborhood garbage collector.We'll be swinging by your place\n in just 1 hour to whisk away your waste.🗑️♻️\nPlease ensure your bins are ready and accessible. Your contribution to a cleaner environment is truly appreciated! See you soon!👋🌿\n#CleanUpHeroes")
                  

                    

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
            )

          ],
        
        )
      )
    );
  }
}