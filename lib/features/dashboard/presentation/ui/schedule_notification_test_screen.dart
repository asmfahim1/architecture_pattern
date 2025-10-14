import 'package:architecture_pattern/core/firebase_manager/firebase_notification_service.dart';
import 'package:flutter/material.dart';

class ScheduleNotificationTestScreen extends StatefulWidget {
  const ScheduleNotificationTestScreen({super.key});

  @override
  State<ScheduleNotificationTestScreen> createState() => _ScheduleNotificationTestScreenState();
}

class _ScheduleNotificationTestScreenState extends State<ScheduleNotificationTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Notification Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                FirebaseNotificationService.showNotification(0, "Instant Notification", "you have instant notification");
              },
              child: const Text('instant Notification'),
            ),
            ElevatedButton(
              onPressed: () {
                // TODO: Schedule notification
                FirebaseNotificationService.scheduleNotification(id: 1, title: "Scheduled notification", body: "You have a schedule in $DateTime.timestamp()", scheduledTime: DateTime.now().add(const Duration(seconds: 3)));
              },
              child: const Text('scheduled Notification'),
            ),
          ],
        ),
      ),
    );
  }
}
