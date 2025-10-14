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

/// Background message handler for Firebase Messaging
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print('Handling a background message ${message.messageId}');
  }

  debugPrint('Message received: ${message.data}');
  debugPrint('Notification body : ${message.notification?.body}');

  final data = message.data;
  final notification = message.notification;

  if (data['type'] == 'call') {
    final callData = {
      'title': notification?.title,
      'body': notification?.body,
      'appointment_code': data['appointment_code'],
      'appointment_id': data['appointment_id'],
    };

    FirebaseNotificationService.showCallNotification(callData: callData);
  }
  else if (data['type'] == 'appointment') {
    if (notification != null) {
      String? name = "${data["name"]}";
      String combinedString = "${data["date"]}T${data["time"]}:00.000";
      DateTime dateTime = DateTime.parse(combinedString);

      FirebaseNotificationService.showNotification(
          notification.hashCode,
          notification.title,
          notification.body
      );
    }
  } else {
    if (notification != null) {
      FirebaseNotificationService.showNotification(
          notification.hashCode,
          notification.title,
          notification.body
      );
    }
  }
}

class FirebaseNotificationService {
  static FirebaseMessaging? _firebaseMessaging;

  /// Initialize only local notification service (without Firebase)
  static Future<void> initLocalOnly() async {
    // Setup local notification channel
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
        debugPrint('Notification response received: ${response.actionId}');
        debugPrint('Payload: ${response.payload}');
      },
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Request notification permissions
    if (!kIsWeb && !Platform.isLinux) {
      await PermissionUtil.notificationRequest();
    }
  }

  /// Full initialization including Firebase (when needed)
  static Future<void> init({bool isBackgroundIsolate = false}) async {
    // Initialize Firebase only if it hasn't been initialized yet
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    } catch (e) {
      if (kDebugMode) {
        print("Firebase already initialized or error: $e");
      }
    }

    _firebaseMessaging ??= FirebaseMessaging.instance;

    // Set callback handler for background notification
    try {
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    } catch (e) {
      if (kDebugMode) {
        print("Background handler already registered: $e");
      }
    }

    // Setup local notification channel
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

    await _firebaseMessaging?.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Request notification permissions
    if (!isBackgroundIsolate) {
      await PermissionUtil.notificationRequest();
    } else {
      if (kDebugMode) {
        print("Skipping permission request in background isolate");
      }
    }
  }

  /// Initialize settings for handling notification responses
  /// Works for both Firebase and local notifications
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
        debugPrint('Notification response received: ${response.actionId}');
        debugPrint('Payload: ${response.payload}');
        handleNotificationCallback(response);
      },
    );

    // Only setup Firebase listener if Firebase is initialized
    if (Platform.isAndroid && _firebaseMessaging != null) {
      FirebaseMessaging.onMessage.listen((event) => onData(event));
    }
  }

  /// Get Firebase token (only available when Firebase is initialized)
  static Future<String?> getToken() async => await _firebaseMessaging?.getToken();

  /// Dispose of Firebase messaging instance
  static void dispose() {
    _firebaseMessaging = null;
  }

  /// Show an incoming call notification with action buttons
  static Future<void> showCallNotification({
    required Map<String, dynamic> callData,
  }) async {
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

    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
    DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      categoryIdentifier: 'call',
      interruptionLevel: InterruptionLevel.critical,
      threadIdentifier: 'video_calls',
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

  /// Schedule a local notification at specific time
  /// Works without Firebase dependency
  static Future<void> scheduleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
  }) async {
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

  /// Show immediate local notification
  /// Works without Firebase dependency
  static void showNotification(int? id, String? title, String? body) {
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
