import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'Delete_Page.dart';
import 'Open_Page.dart';

class Cloud_Notification extends StatefulWidget {

  @override
  State<Cloud_Notification> createState() => _Cloud_NotificationState();
}

class _Cloud_NotificationState extends State<Cloud_Notification> {
  FirebaseMessaging messaging;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value){
      print("Token : "+value.toString());
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");

      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 10,
              channelKey: 'basic_channel',
              title: 'Simple notification',
              body: event.notification.body,
          ),
          actionButtons: [
            NotificationActionButton(
              key: "open",
              label: "Open File",
            ),
            NotificationActionButton(
              key: "delete",
              label: "Delete File",
            )
          ]
      );

      AwesomeNotifications().actionStream.listen((action) {
        if(action.buttonKeyPressed == "open"){
          print("Open button is pressed");
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Open_Page()));
        }
      });


    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cloud_Notification"),
      ),
      body: Center(
        child: Text("Save"),
      ),
    );
  }
}
