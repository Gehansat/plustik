import 'package:flutter/material.dart';

class NotifyTypePage extends StatelessWidget {
  const NotifyTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return MaterialApp(home: CheckBoxList());
  }
}

class CheckBoxList extends StatefulWidget {
  @override
  _CheckBoxListState createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;

  @override
  Widget build(BuildContext context) {
        double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // SizedBox(height: screenheight * 0.12),
          const SizedBox(height: 5),
          Image.asset("assets/logo.png", scale: 1.1),
          SizedBox(height: screenheight * 0.03),
          const Center(
            child: Text(
              'Select Notification Type',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),

          CheckboxListTile(
            title: Text('Before two hours'),
            value: _value1,
            onChanged: (bool? value) {
              setState(() {
                _value1 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Before one hour'),
            value: _value2,
            onChanged: (bool? value) {
              setState(() {
                _value2 = value!;
              });
            },
          ),
          CheckboxListTile(
            title: Text('Before 30 minutes'),
            value: _value3,
            onChanged: (bool? value) {
              setState(() {
                _value3 = value!;
              });
            },
          ),
          const SizedBox(height: 60),
            Container(
              // width: screenwidth * 0.8,
                    height: screenheight * 0.08,
                    decoration: BoxDecoration(
                      color: const Color(0xff00B140),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text("Save",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            Container(
              // width: screenwidth * 0.8,
                    height: screenheight * 0.08,
                    decoration: BoxDecoration(
                      color: const Color(0xff00B140),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text("View",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
        ],
      ),
    );
  }
}
