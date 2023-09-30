import 'package:flutter/material.dart';
import 'package:plustik/pages/login/login.dart';

class IntroPage4 extends StatelessWidget {
  const IntroPage4({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Image.asset(
              "assets/Vector3.png",
              width: screenwidth,
              fit: BoxFit.cover,
            ),
            Positioned(
                left: screenwidth / 2 - 130,
                top: 30,
                child: Image.asset(
                  "assets/logo.png",
                  scale: 1.15,
                ))
          ]),
          const SizedBox(
            height: 45,
          ),
          Container(
            height: 55,
            width: screenwidth * 0.77,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xff00B140)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      //remove all defualt button styles
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.transparent),
                      overlayColor: MaterialStatePropertyAll<Color>(Colors
                          .transparent), // Set the overlay color to transparent
                      elevation: MaterialStatePropertyAll<double>(
                          0), // Set the elevation to 0 (no shadow)
                      shadowColor: MaterialStatePropertyAll<Color>(Colors
                          .transparent), // Set the shadow color to transparent
                      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                          EdgeInsets.zero), // Set padding to zero
                      shape: MaterialStatePropertyAll<OutlinedBorder>(
                          StadiumBorder()),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: const Text(
                      "Join Us Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?",
                  style: TextStyle(color: Color(0xff1D2D47), fontSize: 15.5)),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: ElevatedButton(
                  style: const ButtonStyle(
                      //remove all defualt button styles
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.transparent),
                      overlayColor: MaterialStatePropertyAll<Color>(Colors
                          .transparent), // Set the overlay color to transparent
                      elevation: MaterialStatePropertyAll<double>(
                          0), // Set the elevation to 0 (no shadow)
                      shadowColor: MaterialStatePropertyAll<Color>(Colors
                          .transparent), // Set the shadow color to transparent
                      padding: MaterialStatePropertyAll<EdgeInsetsGeometry>(
                          EdgeInsets.zero), // Set padding to zero
                      shape: MaterialStatePropertyAll<OutlinedBorder>(
                          StadiumBorder()),
                    ),
                  onPressed: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                  },
                  child: const Text("SIGN IN",
                      style: TextStyle(color: Color(0xff00B140), fontSize: 15.5)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
