// import 'dart:io';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:provider/provider.dart';
//
// class PushNotificationsWidget extends StatefulWidget {
//   final Widget child;
//   final GlobalKey<NavigatorState> navigatorKey;
//   PushNotificationsWidget({
//     @required this.child,
//     @required this.navigatorKey,
//   });
//
//   @override
//   _AppNoficationsState createState() => _AppNoficationsState();
// }
//
// class _AppNoficationsState extends State<PushNotificationsWidget> {
//   static FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   FirebaseMessaging _firebaseMessaging;
//
//   @override
//   initState() {
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _firebaseMessaging = Provider.of<FirebaseMessaging>(context);
//     checkAuth();
//   }
//
//   void checkAuth() async {
//     final isAuth = await StorageHelper.get(StorageKeys.auth);
//     if (isAuth != null) {
//       final partner = await StorageHelper.get(StorageKeys.partnerId);
//       _initLocalNotifications();
//       _initFirebaseMessaging(partner);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }
//
//   _initLocalNotifications() {
//     var initializationSettingsAndroid =
//     new AndroidInitializationSettings('@mipmap/ic_launcher');
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
//   void _navigate(NotifModel model) async {
//     final ctx = widget.navigatorKey.currentContext;
//     Provider.of<RoutesBloc>(ctx).setNotif(model);
//   }
//
//   void _openNofication(NotifModel model) async {
//     final ctx = widget.navigatorKey.currentContext;
//     final provider = Provider.of<NotificationsBloc>(ctx);
//     await provider.addNotification(model);
//   }
//
//   _initFirebaseMessaging(String partnerId) {
//     _firebaseMessaging.configure(
//       onMessage: (Map<String, dynamic> message) {
//         print('AppPushs onMessage : $message');
//         final mg = parseMessage(message);
//         _onMessage(mg);
//         //_showNotification(message, context: context, isOpen: true);
//         return;
//       },
//       onBackgroundMessage: Platform.isIOS ? null : myBackgroundMessageHandler,
//       onResume: (Map<String, dynamic> message) {
//         print('AppPushs onResume : $message');
//         if (Platform.isIOS) {
//           _showNotification(message);
//         }
//         final mg = parseMessage(message);
//         _openNofication(mg);
//         return;
//       },
//       onLaunch: (Map<String, dynamic> message) {
//         print('AppPushs onLaunch : $message');
//         final mg = parseMessage(message);
//         _navigate(mg);
//         return;
//       },
//     );
//     _firebaseMessaging.requestNotificationPermissions(
//         const IosNotificationSettings(sound: true, badge: true, alert: true));
//     firebaseMessaging.subscribeToTopic("ch$partnerId");
//     _firebaseMessaging.onIosSettingsRegistered.listen((event) {print("Notifications");});
//
//
//   }
//
//   _onMessage(NotifModel model) async {
//     print("widget.navigatorKey ${widget.navigatorKey == null}");
//     if(widget.navigatorKey != null){
//       final ctx = widget.navigatorKey.currentContext;
//       final provider = Provider.of<NotificationsBloc>(ctx);
//       await provider.increaseBadger();
//       await provider.requestBadger();
//       await provider.addNotification(model);
//     }
//   }
//
//   static Future<dynamic> myBackgroundMessageHandler(
//       Map<String, dynamic> message) {
//     print('AppPushs myBackgroundMessageHandler : $message');
//     _showNotification(message);
//     return Future<void>.value();
//   }
//
//   NotifModel parseMessage(Map<String, dynamic> message) {
//     try {
//       final hasData = message.containsKey("data");
//       if (hasData) {
//         final data = Platform.isIOS ?  message :  message["data"];
//         final isSystem = data["is_system"];
//         final viewed = data["viewed"];
//         final send = data["sent"];
//         final body = data["body"];
//         final title = data["title"];
//         final meta = data["meta"];
//         final id = data["id"];
//         return NotifModel(
//             body: body,
//             isSystem: isSystem == "true",
//             meta: meta,
//             sent: send == "true",
//             title: title,
//             viewed: viewed == "true",
//             id: id);
//       }
//     } catch (e) {
//       print(e);
//     }
//     return null;
//   }
//
//   handleMessage(Map<String, dynamic> message) {
//     final notif = parseMessage(message);
//     Provider.of<NotificationsBloc>(context).addNotification(notif);
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
//     final isEnabled = await SecureStorageHelper.get(StorageKeys.notification);
//     if (isEnabled != "no" && showNotification) {
//       var platformChannelSpecificsAndroid = new AndroidNotificationDetails(
//           'odex_ss_app',
//           'odex_ss_notification_channel',
//           'Receive and manage notification for odex ss application',
//           playSound: true,
//           priority: Priority.high,
//           importance: Importance.high,
//           enableVibration: false);
//       var platformChannelSpecificsIos =
//       new IOSNotificationDetails(presentSound: false);
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
//           payload: 'No_Sound',
//         );
//       });
//     }
//   }
// }