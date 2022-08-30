// import 'dart:io';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:jt_trading/src/utils/storage/storage_helper.dart';
// import 'package:jt_trading/src/utils/storage/storage_keys.dart';
//
// class NotificationWidget extends StatefulWidget {
//   final Widget child;
//   NotificationWidget({@required this.child});
//   @override
//   _NotificationWidgetState createState() => _NotificationWidgetState();
// }
//
// class _NotificationWidgetState extends State<NotificationWidget> {
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
//   static FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   @override
//   initState() {
//     super.initState();
//     // _firebaseMessaging.su
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _configFirebase();
//   }
//
//   void _configFirebase() async {
//     final isAuth = await StorageHelper.get(StorageKeys.auth);
//     // if (isAuth != null) {
//     final deviceToken = await StorageHelper.get(StorageKeys.deviceToken);
//     _initLocalNotifications();
//     _initFirebaseMessaging();
//     // }
//   }
//
//   _initFirebaseMessaging() {
//     _firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) {
//         print('AppPushs onMessage : $message');
//         //_showNotification(message, context: context, isOpen: true);
//         return;
//       },
//       onBackgroundMessage: Platform.isIOS ? null : myBackgroundMessageHandler,
//       onResume: (Map<String, dynamic> message) {
//         print('AppPushs onResume : $message');
//         if (Platform.isIOS) {
//           _showNotification(message);
//         }
//         return;
//       },
//       onLaunch: (Map<String, dynamic> message) {
//         print('AppPushs onLaunch : $message');
//         return;
//       },
//     );
//     _firebaseMessaging.requestNotificationPermissions(
//       const IosNotificationSettings(sound: true, badge: true, alert: true),
//     );
//   }
//
//   _initLocalNotifications() {
//     var initializationSettingsAndroid =
//         new AndroidInitializationSettings('@mipmap/ic_launcher');
//     var initializationSettingsIOS = new IOSInitializationSettings();
//     var initializationSettings = new InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     _flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: selectNotification);
//   }
//
//   Future selectNotification(String payload) async {
//     print("payload ${context == null} $payload");
//     await Future.delayed(Duration.zero);
//     // await _navigate();
//   }
//
//   static Future<dynamic> myBackgroundMessageHandler(
//       Map<String, dynamic> message) async {
//     if (message.containsKey('data')) {
//       final dynamic data = message['data'];
//     }
//     if (message.containsKey('notification')) {
//       final dynamic notification = message['notification'];
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }
//
//   static Future _showNotification(Map<String, dynamic> message,
//       {bool showNotification = true}) async {
//     var pushTitle;
//     var pushText;
//     var action;
//     var meta;
//     if (!message.containsKey('data')) return;
//     final nodeData = message['data'];
//     pushTitle = nodeData['title'];
//     pushText = nodeData['body'];
//     meta = nodeData['meta'];
//     if (message.containsKey('action')) {
//       action = nodeData['action'];
//     }
//
//     final isEnabled = await StorageHelper.get(StorageKeys.enableNotification);
//     if (isEnabled != "no" && showNotification) {
//       var platformChannelSpecificsAndroid = new AndroidNotificationDetails(
//           'khata_app',
//           'khata_notification_channel',
//           'Receive and manage notification for khata ',
//           playSound: true,
//           priority: Priority.high,
//           importance: Importance.high,
//           enableVibration: false);
//       var platformChannelSpecificsIos =
//           new IOSNotificationDetails(presentSound: false);
//       var platformChannelSpecifics = new NotificationDetails(
//           android: platformChannelSpecificsAndroid,
//           iOS: platformChannelSpecificsIos);
//
//       new Future.delayed(Duration.zero, () {
//         _flutterLocalNotificationsPlugin.show(
//           0,
//           pushTitle,
//           pushText,
//           platformChannelSpecifics,
//         );
//       });
//     }
//   }
// }
