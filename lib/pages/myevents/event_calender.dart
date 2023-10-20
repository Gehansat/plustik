import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plustik/pages/myevents/add_event.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/eventModel.dart';
import 'package:intl/intl.dart';

class EventCalenderPage extends StatefulWidget {
  const EventCalenderPage({super.key});

  @override
  State<EventCalenderPage> createState() => _EventCalenderPageState();
}

class _EventCalenderPageState extends State<EventCalenderPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Event> events = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20 ,10),
            child: TableCalendar(
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
                    fetchEvents(selectedDay);
                  });
                },
                calendarStyle: const CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Color(0xff00B140),
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: TextStyle(color: Colors.white),
                  todayDecoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  todayTextStyle: TextStyle(color: Colors.white),
                )
            ),
          ),
          EventListView(events: events),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),

              primary: Color(0xff00B140),
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (ctx) => AddEventPage()));
            },
            child: const Text("Add Event"),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  void fetchEvents(DateTime selectedDate) async {
    final eventCollection = FirebaseFirestore.instance.collection('calendarevents');
    final QuerySnapshot eventQuery = await eventCollection
        .where('DateTime', isGreaterThanOrEqualTo: Timestamp.fromDate(selectedDate))
        .where('DateTime', isLessThan: Timestamp.fromDate(selectedDate.add(Duration(days: 1))))
        .get();

    setState(() {
      events = eventQuery.docs.map((event) {
        return Event(
          eventName: event['EventName'],
          dateTime: (event['DateTime'] as Timestamp).toDate(),
          venue: event['Venue'],
          category: event['Category'],
        );
      }).toList();
    });
  }
}

class EventListView extends StatelessWidget {
  final List<Event> events;

  EventListView({required this.events});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];

          // Format the DateTime to display in a user-friendly way
          String formattedTime = DateFormat('MMMM d, y - h:mm a').format(event.dateTime);

          return ListTile(

            title: Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.eventName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xff00B140),
                    ),
                  ),
                  Text(
                    'Category: ${event.category}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Venue: ${event.venue}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    'Time: $formattedTime',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            tileColor: Colors.white,
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          );
        },
      ),
    );
  }
}