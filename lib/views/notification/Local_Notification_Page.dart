import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_example/views/Notification/Delete_Page.dart';
import 'package:mvvm_example/views/Notification/Open_Page.dart';
import 'package:mvvm_example/MVVM_Home_Page.dart';

class Local_Notification_Page extends StatefulWidget {
  @override
  State<Local_Notification_Page> createState() => _Local_Notification_PageState();
}

class _Local_Notification_PageState extends State<Local_Notification_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notification"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("1. Simple notification"),
                RaisedButton(
                  onPressed: (){
                    AwesomeNotifications().createNotification(
                        content: NotificationContent(
                            id: 1,
                            channelKey: 'basic_channel',
                            title: 'Simple notification',
                            body: 'Simple body'
                        )
                    );
                  },
                  child: Container(
                    child: Text("Save"),
                  ),
                ),
              ],
            ),
            Divider(),

            SizedBox(height: 5.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("2. Badge Indicatior notification"),
                RaisedButton(
                  onPressed: (){
                    AwesomeNotifications().createNotification(
                        content: NotificationContent(
                            id: 2,
                            channelKey: 'basic_channel',
                            title: 'Badge Indicator notification',
                            body: 'Badge',

                        ),
                    );
                  },
                  child: Container(
                    child: Text("Save"),
                  ),
                ),
              ],
            ),
            Divider(),

            SizedBox(height: 5.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("3. Big Image notification"),
                RaisedButton(
                  onPressed: (){
                    AwesomeNotifications().createNotification(
                        content: NotificationContent(
                            id: 3,
                            channelKey: 'big_picture',
                            title: 'Big Image notification',
                            body: 'Simple body',
                          payload: {"name":"Flutter"},
                          bigPicture: "asset://Asset/Images/bg.jpg",
                          notificationLayout: NotificationLayout.BigPicture,
                          autoDismissible: false,
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
                    // Direct Click Event
                    // AwesomeNotifications().actionStream.listen((receivedNotification){
                    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage_MVVM()));
                    // });

                    // Button Click Event
                    AwesomeNotifications().actionStream.listen((action) {
                      if(action.buttonKeyPressed == "open"){
                        print("Open button is pressed");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Open_Page()));
                      }else if(action.buttonKeyPressed == "delete"){
                        print("Delete button is pressed.");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Delete_Page()));
                      }else{
                        print(action.payload);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage_MVVM()));
                      }
                    });

                  },
                  child: Container(
                    child: Text("Save"),
                  ),
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
