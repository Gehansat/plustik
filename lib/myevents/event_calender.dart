import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plustik/myevents/add_event.dart';
import 'package:table_calendar/table_calendar.dart';

class EventCalenderPage extends StatelessWidget {
  const EventCalenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(


          children: [
            const SizedBox(height: 40),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute(builder: (ctx) => AddEventPage()),
              );},
              child: const Text("Add Event"),
            ),
          ],
        ),
      ),
    );
  }
}
