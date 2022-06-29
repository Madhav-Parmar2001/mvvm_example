
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mvvm_example/views/Notification/Local_Notification_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../views/Notification/Cloud_Notification.dart';


class Notification_HomePage extends StatefulWidget
{
  @override
  _Notification_HomePageState createState() => _Notification_HomePageState();
}

class _Notification_HomePageState extends State<Notification_HomePage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("notification Home"),
        centerTitle: true,
      ),
     body: ListView(
       children: [
         // UserAccountsDrawerHeader(
         //   accountName: Text("Welcome, Guest!"),
         //   accountEmail: Text("test@gmail.com"),
         // ),
         ListTile(
           leading: Icon(Icons.arrow_forward_ios),
           title: Text("Local notification"),
           onTap: (){
             Navigator.of(context).push(
                 MaterialPageRoute(builder: (context) => Local_Notification_Page(),)
             );
           },
         ),
         Divider(),

         ListTile(
           leading: Icon(Icons.arrow_forward_ios),
           title: Text("Cloud notification"),
           onTap: (){
             Navigator.of(context).push(
                 MaterialPageRoute(builder: (context) => Cloud_Notification(),)
             );
           },
         ),
         Divider(),

       ],
     ),
    );
  }
}
