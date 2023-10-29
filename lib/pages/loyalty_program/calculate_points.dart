import 'package:flutter/material.dart';
import 'package:plustik/pages/loyalty_program/redeem_points.dart';

class CalculatePointsPage extends StatefulWidget {
  final int loyaltyPoints;

  CalculatePointsPage({required this.loyaltyPoints});

  @override
  _PointsCalculatorState createState() => _PointsCalculatorState();
}

class _PointsCalculatorState extends State<CalculatePointsPage> {
  TextEditingController weightController = TextEditingController();
  int selectedAvatarIndex = 0;
  int totalPoints = 0;
  @override
  void initState() {
    super.initState();
    totalPoints = widget.loyaltyPoints;
  }

  Map<String, int> wasteCategoryPoints = {
    'glass': 3,
    'paper': 4,
    'plastic': 3,
    'organic': 5
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Transform.translate(
                          offset: Offset(
                              0, -MediaQuery.of(context).size.height * 0.16),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/Vector2.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          CircleAvatar(
                              radius: 65,
                              backgroundColor:
                                  const Color.fromARGB(255, 195, 248, 223),
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '$totalPoints',
                                      style: TextStyle(
                                        fontSize: 45,
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
                          SizedBox(height: 14),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'You have earned a total of $totalPoints points for your responsible waste disposal efforts. Keep up the great work!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.5,
                                color: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 25),
              Transform.translate(
                  offset: Offset(0, -140.0),
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Select the Waste Category ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(4, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAvatarIndex = index;
                              });
                            },
                            child: CircleAvatar(
                              radius: 43,
                              backgroundColor: selectedAvatarIndex == index
                                  ? Color.fromARGB(255, 119, 228, 192)
                                  : Colors.transparent,
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/image$index.jpg'),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 25),
                    Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Enter weight of the waste in kg (Kilo Gram)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          controller: weightController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'ex: 2',
                          ),
                          keyboardType: TextInputType.number,
                        )),
                    SizedBox(height: 27),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            calculatePoints();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 110, vertical: 13),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Calculate Points',
                              style: TextStyle(fontSize: 16)),
                        ),
                        SizedBox(height: 13),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RedeemPage(points: totalPoints),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFD9D9D9),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 94, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Confirm and Collect',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ],
                    ),
                  ]))
            ],
          ),
        ));
  }

  void calculatePoints() {
    String selectedCategory = 'glass';
    switch (selectedAvatarIndex) {
      case 0:
        selectedCategory = 'glass';
        break;
      case 1:
        selectedCategory = 'paper';
        break;
      case 2:
        selectedCategory = 'plastic';
        break;
      case 3:
        selectedCategory = 'organic';
        break;
    }
    int weight = int.parse(weightController.text);
    int pointsForSelectedCategory = wasteCategoryPoints[selectedCategory] ?? 0;
    int calculatedPoints = weight * pointsForSelectedCategory;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
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
            "You have added $calculatedPoints points for disposing $weight kg of $selectedCategory waste.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 16.0,
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
          backgroundColor: Colors.white,
          elevation: 24.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        );
      },
    );

    setState(() {
      totalPoints += calculatedPoints;
    });

    selectedAvatarIndex = 0;
    weightController.clear();
  }
}
