
import 'package:cheni/routing.dart';
import 'package:cheni/services/Navigation.service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('Handling a background message: ${message.messageId}');
  PushNotificationService().displayNotificationMessage(message);
}

// void notificationTapBackground(NotificationResponse response) {
//   if (response.payload != null) {
//     //handleNotificationClick(response.payload!);
//   }
// }

class PushNotificationService {
  // final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  FirebaseMessaging _fcm = FirebaseMessaging.instance;

  init() async {
    // Listen on message when the user is on the application
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      PushNotificationService().displayNotificationMessage(message);
    });

    // Listen on message when the user is NOT on the application
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        PushNotificationService().displayNotificationMessage(message);
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print('Message cliqué !');
      print(message.data);
      var route = message.data["route"];

      if (route != null) {
        if (route == "/image") {
          navigationService.navigateTo(ScreenEnum.imageViewer);
        } else {
          await navigationService.openWebUrl("https://www.google.com/");
        }
      }
    });

    // final NotificationAppLaunchDetails? notificationAppLaunchDetails =
    //     await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    // var selectedNotificationPayload;

    // String initialRoute = "/";
    // if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
    //   selectedNotificationPayload =
    //       notificationAppLaunchDetails!.notificationResponse?.payload;
    //   print("OKKKKK TOTO");
    // }

    // const initializationSettingsAndroid =
    //     AndroidInitializationSettings('@mipmap/ic_launcher');

    // const DarwinInitializationSettings initializationSettingsDarwin =
    //     DarwinInitializationSettings(
    //   requestAlertPermission: false,
    //   requestBadgePermission: false,
    //   requestSoundPermission: false,
    // );

    // const initializationSettings = InitializationSettings(
    //   android: initializationSettingsAndroid,
    //   iOS: initializationSettingsDarwin,
    // );

    // var toto = await flutterLocalNotificationsPlugin.initialize(
    //   initializationSettings,
    //   onDidReceiveNotificationResponse: notificationTapBackground,
    //   onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    // );
  }

  void displayNotificationMessage(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    // if (notification != null && android != null) {
    //   flutterLocalNotificationsPlugin.show(
    //     notification.hashCode,
    //     notification.title,
    //     notification.body,
    //     const NotificationDetails(
    //       android: AndroidNotificationDetails(
    //         'channel_id',
    //         'channel_name',
    //         importance: Importance.max,
    //         priority: Priority.high,
    //         icon: '@mipmap/ic_launcher',
    //       ),
    //     ),
    //     payload: "Payload",
    //   );
    // }
  }

  Future<bool> requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    print('Notification permission status: ${settings.authorizationStatus}');

    if (settings.authorizationStatus == AuthorizationStatus.denied ||
        settings.authorizationStatus == AuthorizationStatus.notDetermined) {
      return false;
    } else {
      return true;
    }
  }

  Future<String?> getToken() async {
    String? token = await _fcm.getToken();
    print('Token: $token');
    return token;
  }
}
