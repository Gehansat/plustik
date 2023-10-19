import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plustik/pages/myevents/add_event.dart';
import 'package:table_calendar/table_calendar.dart';

class EventCalenderPage extends StatefulWidget {
  const EventCalenderPage({super.key});

  @override
  State<EventCalenderPage> createState() => _EventCalenderPageState();
}

class _EventCalenderPageState extends State<EventCalenderPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar Page'),
      ),
      body: Column(
        children: <Widget>[
          TableCalendar(
            calendarBuilders: CalendarBuilders(),
            firstDay: DateTime(2021),
            lastDay: DateTime(2030),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
          ),
          // You can display the events here for the selected day
          // For example, use a ListView to list events for the selected day
          // and retrieve events from Firebase based on the selected date
          // and display them using your Event model.
          // Example: EventListView(selectedDate: _selectedDay),
          ElevatedButton(onPressed: () {
            Navigator.of(context).push(
              CupertinoPageRoute(builder: (ctx) => AddEventPage()),
            );},
            child: const Text("Add Event"),
          ),
        ],
      ),
    );
  }
}
