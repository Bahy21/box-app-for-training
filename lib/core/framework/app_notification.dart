import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@injectable
class AppNotifications {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AppNotifications() {
    initLocalNotifications();
  }

  Future<void> initLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    InitializationSettings initializationSettings =
        const InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsIOS,
        );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) {},
      onDidReceiveBackgroundNotificationResponse: onReceiveBackgroundResponse,
    );

    await _setupNotificationChannels();
  }

  Future<void> _setupNotificationChannels() async {
    AndroidNotificationChannel defaultChannel =
        const AndroidNotificationChannel(
          'channel_id',
          'Default Channel',
          description: 'Channel for default notifications',
          importance: Importance.max,
          playSound: true,
        );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(defaultChannel);
  }

  Future<void> showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotificationDetails androidNotificationDetails =
        const AndroidNotificationDetails(
          'high_importance_channel',
          'Default Channel',
          channelDescription: 'Default notifications channel',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          ticker: 'ticker',
        );
    DarwinNotificationDetails iosPlatformChannelSpecifics =
        const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        );
    if (notification != null) {
      await flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: androidNotificationDetails,
          iOS: iosPlatformChannelSpecifics,
        ),
      );
    }
  }

  @pragma('vm:entry-point')
  static void onReceiveBackgroundResponse(NotificationResponse details) async {
    debugPrint('Background notification response: $details');
  }
}
