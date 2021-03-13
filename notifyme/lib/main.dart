import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Notification());
}

class Notification extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return NotificationState();
  }
}

class NotificationState extends State<Notification> {
  FlutterLocalNotificationsPlugin fltrNotif;
  int notifNum=0;

  @override
  void initState() {
    super.initState();
    var androidInitilize = new AndroidInitializationSettings('mipmap/ic_launcher');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(
        android: androidInitilize, iOS: iOSinitilize);
    fltrNotif = new FlutterLocalNotificationsPlugin();
    fltrNotif.initialize(initilizationsSettings);
  }

  Future showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "18IT099", "Ritik", "This is NotifyMe!",
        importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
    new NotificationDetails(android: androidDetails, iOS: iSODetails);
    notifNum ++;
    await fltrNotif.show(
        0, "Notification number: $notifNum", "18IT099", generalNotificationDetails,
        payload: "Task");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              '18IT099',
              style: TextStyle(
                fontSize: 30.0,
                fontFamily: 'Roboto',
                color: Colors.cyanAccent[600],
              ),
            ),
          ),
          body: Center(
            child: RaisedButton(
              onPressed: showNotification,
              child: Text('Click me to get a notification'),
            ),
          )),
    );

  }
}