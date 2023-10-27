import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Appointments'),
        backgroundColor: Color(0xff00B140),
      ),
      body: AppointmentsList(),
    );
  }
}

class AppointmentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('AppointmentDetails').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var appointments = snapshot.data!.docs;

        if (appointments.isEmpty) {
          return Center(
            child: Text('You have no appointments.', style: TextStyle(fontSize: 20)),
          );
        }

        return ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            var appointmentData = appointments[index].data() as Map<String, dynamic>;
            var appointmentId = appointments[index].id;

            return Card(
              margin: EdgeInsets.all(10),
              child: AppointmentTile(appointmentData: appointmentData, appointmentId: appointmentId),
            );
          },
        );
      },
    );
  }
}

class AppointmentTile extends StatelessWidget {
  final Map<String, dynamic> appointmentData;
  final String appointmentId;

  AppointmentTile({required this.appointmentData, required this.appointmentId});

  @override
  Widget build(BuildContext context) {
  return ListTile(
    title: Text('Date: ${appointmentData['date']}'),
    subtitle: Text('Time: ${appointmentData['time']}'),
    trailing: IconButton(
      icon: Icon(Icons.delete),
      color: Colors.red, // Set the color of the delete icon
      onPressed: () {
        showDeleteConfirmationDialog(context);
      },
    ),
    // You can add more appointment details here
  );
}

  void showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this appointment?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // Implement the logic to delete the appointment here
                deleteAppointment(appointmentId);
                Navigator.of(dialogContext).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteAppointment(String appointmentId) async {
    try {
      await FirebaseFirestore.instance.collection('AppointmentDetails').doc(appointmentId).delete();
    } catch (error) {
      print('Error deleting appointment: $error');
      // Handle any potential errors when deleting the appointment
    }
  }
}
