import 'package:flutter/material.dart';
import 'package:plustik/pages/home_page.dart';

class PackagePage extends StatelessWidget {
  const PackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35),
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/person.jpg'),
                ),
                SizedBox(width: 20),
                Text(
                  'Hi John!',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 10),
            const Text(
              'Choose your Package',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            _buildPackageOption(
              'Occasional Disposer',
              'One Day Plan',
              [
                '1. Once-a-week waste disposal.',
                '2. Offers a cost-effective solution.',
                '3. Earn loyalty points.',
              ],
              'Rs.1000/=',
            ),
            SizedBox(height: 12),
            _buildPackageOption(
              'Regular Disposer',
              'Two Day Plan',
              [
                '1. Twice-a-week waste disposal.',
                '2. Provides flexibility and savings.',
                '3. Earn more loyalty points.',
              ],
              'Rs.2000/=',
            ),
            SizedBox(height: 12),
            _buildPackageOption(
              'Dedicated Disposer',
              'Three or More Days Plan',
              [
                '1. Unlimited waste collections.',
                '2. Offers maximum value.',
                '3. Unlock loyalty benefits and bonus points.',
              ],
              'Rs.3500/=',
            ),
            SizedBox(height: 25),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Note:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                ' You can easily purchase your preferred plan directly from our friendly garbage collectors during waste collection.',
                            style: TextStyle(fontSize: 15)),
                      ],
                    ),
                  ),
                  SizedBox(height: screenheight * 0.03),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 70, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('BACK TO HOME',
                        style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPackageOption(
    String title,
    String subtitle,
    List<String> points,
    String price,
  ) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity,
        maxHeight: 150,
      ),
      child: Stack(
        children: [
          Container(
            width: 500,
            height: 150,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 245, 245, 245),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 2),
                Text(subtitle,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                SizedBox(height: 2),
                for (var point in points) ...[
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(point,
                        style:
                            TextStyle(fontSize: 14, color: Colors.grey[700])),
                  ),
                  SizedBox(height: 2),
                ]
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: -23,
            child: Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(price,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
