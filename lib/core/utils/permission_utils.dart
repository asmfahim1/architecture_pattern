
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static Future<void> notificationRequest() async {
    try {
      if (Platform.isIOS) {
        // iOS-specific handling
        final settings = await FirebaseMessaging.instance.requestPermission(
          alert: true,
          badge: true,
          sound: true,
        );

        if (settings.authorizationStatus != AuthorizationStatus.authorized) {
          await _openSettingsWithFallback();
        }
      } else {
        // Android handling
        final status = await Permission.notification.request();
        if (!status.isGranted) {
          await _openSettingsWithFallback();
        }
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error requesting notification permissions: $e');
        print('Stack trace: $stackTrace');
      }
      // You might want to add crash reporting here
    }
  }

  static Future<void> _openSettingsWithFallback() async {
    try {
      // First try the app_settings package
      // await AppSettings.openAppSettings(
      //   type: AppSettingsType.notification,
      // );
    } catch (e) {
      if (kDebugMode) {
        print('Failed to open settings via app_settings: $e');
      }
      // Fallback to generic settings if app_settings fails
      await openAppSettings();
    }
  }
}