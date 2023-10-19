import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmenttwoDetailsPage extends StatefulWidget {
  @override
  _AppointmenttwoDetailsPageState createState() => _AppointmenttwoDetailsPageState();
}

class _AppointmenttwoDetailsPageState extends State<AppointmenttwoDetailsPage> {
  // Define variables to track the checked state of each waste type.
  bool isPlasticChecked = false;
  bool isPaperChecked = false;
  bool isGlassChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
        backgroundColor: Color(0xff00B140),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  "assets/logo.png",
                  scale: 1.2,
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                      ),
                      SizedBox(height: 20),
                      Text('Type of Waste' , style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                        ),),
                      CheckboxListTile(
                        title: Text('Plastic'),
                        value: isPlasticChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isPlasticChecked = value ?? false;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Paper'),
                        value: isPaperChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isPaperChecked = value ?? false;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text('Glass'),
                        value: isGlassChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isGlassChecked = value ?? false;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Special Instructions'),
                        maxLines: 2,
                      ),
                      SizedBox(height: 20),
                      Text('2 / 2'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Navigate to the Appointments page
                  Navigator.of(context).push(
                    CupertinoPageRoute(builder: (ctx) => AppointmenttwoDetailsPage()),
                  );
                },
                child: Container(
                  width: screenWidth * 0.1,
                  height: screenHeight * 0.08,
                  decoration: BoxDecoration(
                    color: Color(0xff00B140),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      "Make Appointment",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    
                  ),
                ),
              ),SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
