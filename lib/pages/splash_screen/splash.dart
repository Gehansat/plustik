import 'package:flutter/material.dart';
import 'package:plustik/pages/intro_screens/onboarding_screen.dart';
import 'package:plustik/pages/login/auth_page.dart';
import 'package:plustik/pages/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus();
  }

  Future<void> _checkOnboardingStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    if (hasSeenOnboarding) {
      // User has seen onboarding, navigate to your main app screen with a delay.
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthPage()));
      });
    } else {
      // User has not seen onboarding, show the onboarding pages with a delay.
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OnBoaringScreen()));
      });

      // Update the flag to indicate the user has seen the onboarding pages.
      await prefs.setBool('hasSeenOnboarding', true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}
