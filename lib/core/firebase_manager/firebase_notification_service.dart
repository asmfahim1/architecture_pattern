import 'dart:convert';
import 'dart:io';
import 'package:architecture_pattern/core/constants/app_constants.dart';
import 'package:architecture_pattern/core/firebase_manager/firebase_options.dart';
import 'package:architecture_pattern/core/utils/permission_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  Constant.channelId,
  Constant.channelName,
  description: Constant.channelDesc,
  importance: Importance.high,
);

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  // await Firebase.initializeApp();
  if (kDebugMode) {
    print('Handling a background message ${message.messageId}');
  }

  debugPrint('Message received: ${message.data}');
  debugPrint('Notification body : ${message.notification?.body}');
  final data = message.data;
  final notification = message.notification;

  if (data['type'] == 'call') {
    // final secureSessionManager = SecureSessionManager(SecureManager(const FlutterSecureStorage()));
    final callData = {
      'title': notification?.title,
      'body': notification?.body,
      'appointment_code': data['appointment_code'],
      'appointment_id': data['appointment_id'],
    };
    // await secureSessionManager.setCallData(jsonEncode(callData));
    FirebaseNotificationService.showCallNotification(
      callData: callData,
    );
  }
  else if (data['type'] == 'appointment') {
    // Handle background messages
    if (notification != null) {
      final notification = message.notification;
      // Combine into ISO format and parse
      String? name = "${data["name"]}";
      String combinedString = "${data["date"]}T${data["time"]}:00.000";
      DateTime dateTime = DateTime.parse(combinedString);

      // FlutterAlarmManager().scheduleAlarm(name, dateTime);

      FirebaseNotificationService.showNotification(notification.hashCode, notification?.title, notification?.body);
    }
  } else {
    // Handle background messages
    if (notification != null) {
      final notification = message.notification;

      FirebaseNotificationService.showNotification(notification.hashCode, notification?.title, notification?.body);

    }
  }

  /*if (message.notification != null){
    FirebaseMessaging.onMessage.listen((remoteMessage) {

    });
  }*/
}

class FirebaseNotificationService {

  static FirebaseMessaging? _firebaseMessaging;

  static Future<void> init({bool isBackgroundIsolate = false}) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    _firebaseMessaging ??= FirebaseMessaging.instance;

    // set callback handler for background notification
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await _firebaseMessaging?.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Request notification permissions
    // Only request notification permissions if we're NOT in a background isolate
    if (!isBackgroundIsolate) {
      await PermissionUtil.notificationRequest();
    } else {
      if (kDebugMode) {
        print("Skipping permission request in background isolate");
      }
    }
  }

  static void initSettings(
      Function(RemoteMessage message) onData,
      Function(NotificationResponse response) handleNotificationCallback,
      ) async {
    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    DarwinInitializationSettings iosInitializationSetting = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestAlertPermission: true,
      requestBadgePermission: true,
      notificationCategories: <DarwinNotificationCategory>[
        DarwinNotificationCategory(
          'call',
          actions: <DarwinNotificationAction>[
            DarwinNotificationAction.plain(
              'accept',
              'Accept',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.foreground,
              },
            ),
            DarwinNotificationAction.plain(
              'decline',
              'Decline',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.destructive,
              },
            ),
          ],
          options: <DarwinNotificationCategoryOption>{
            DarwinNotificationCategoryOption.allowAnnouncement,
          },
        ),
      ],
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: iosInitializationSetting,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // Handle when user taps on notification
        // _handleNotificationResponse(response);
        debugPrint('Notification response received: ${response.actionId}');
        debugPrint('Payload: ${response.payload}');
        handleNotificationCallback(response);
      },
    );
    if (Platform.isAndroid){
      FirebaseMessaging.onMessage.listen((event) => onData(event),);
    }
  }

  static Future<String?> getToken() async => await _firebaseMessaging?.getToken();

  static void dispose(){
    if (_firebaseMessaging != null){
      _firebaseMessaging = null;
    }
  }

  static void _handleNotificationResponse(NotificationResponse response) {
    // Handle the response from the notification
    // For call notifications, response.actionId would be 'accept' or 'decline'
    if (response.actionId == 'accept') {
      final callData = jsonDecode(response.payload  ?? "{}" );
      if(callData != {} ){

      }
      // Handle call acceptance
      debugPrint('Call accepted');
    } else if (response.actionId == 'decline') {
      // Handle call rejection
      debugPrint('Call declined');
    }
  }

  static Future<void> showCallNotification({
    required Map<String, dynamic> callData,
  }) async {
    // Android configuration
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'call_channel',
      'Incoming Calls',
      channelDescription: 'Incoming call notifications',
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.call,
      fullScreenIntent: true,
      actions: [
        AndroidNotificationAction(
          'accept',
          'Accept',
          showsUserInterface: true,
        ),
        AndroidNotificationAction(
          'decline',
          'Decline',
          showsUserInterface: true,
        ),
      ],
      icon: '@mipmap/ic_launcher',
      color: Colors.green,
    );

    // iOS configuration - critical for action handling
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
    DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      categoryIdentifier: 'call', // Must match AppDelegate category
      interruptionLevel: InterruptionLevel.critical, // Makes notification more prominent
      threadIdentifier: 'video_calls', // Groups similar notifications
    );

    await flutterLocalNotificationsPlugin.show(
      DateTime.now().second.hashCode,
      callData['title'],
      callData['body'],
      const NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      ),
      payload: jsonEncode(callData),
    );
  }

  static Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
    // Initialize timezone database
    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          color: Colors.white,
          icon: "@mipmap/ic_launcher",
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  static showNotification(int? id, String? title, String? body){
    flutterLocalNotificationsPlugin.show(
      id ?? DateTime.now().millisecondsSinceEpoch.hashCode.abs(),
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          color: Colors.white,
          icon: "@mipmap/ic_launcher",
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
    );
  }
}