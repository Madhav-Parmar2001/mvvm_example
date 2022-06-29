import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mvvm_example/Task/admob/Ad_Mobile_Page.dart';
import 'package:mvvm_example/Task/shared_preferance/Shared_Prefrence_List.dart';
import 'package:mvvm_example/Task/Payment/payment.dart';
import 'package:mvvm_example/views/complexapi/astro/ViewAstroScreen.dart';
import 'package:mvvm_example/views/product/AddProduct_Page.dart';
import 'package:mvvm_example/views/product/ViewProduct_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Task/Notification/Notification_HomePage.dart';
import 'Task/dogapipage/dog_home.dart';
import 'views/auth/Login_Page.dart';
import 'views/complexapi/Archive/ViewArchiveScreen.dart';

class HomePage_MVVM extends StatefulWidget
{
  @override
  _HomePage_MVVMState createState() => _HomePage_MVVMState();
}

class _HomePage_MVVMState extends State<HomePage_MVVM>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("MVVM Home"),
        centerTitle: true,
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Welcome, Guest!"),
              accountEmail: Text("test@gmail.com"),
            ),


            ListTile(
              leading: Icon(Icons.arrow_forward_ios),
              title: Text("Login"),
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Login_Page(),)
                );
              },
            ),
            Divider(),
          ],
        ),
      ),

      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("AddProduct_Page API"),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddProduct_Page(),)
              );
            },
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("ViewProduct_Page API"),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewProduct_Page(),)
              );
            },
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("ViewAstro_Page (Complex Api)"),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewAstroScreen(),)
              );
            },
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("ViewArchive_Page ( Complex Api)"),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ViewArchiveScreen(),)
              );
            },
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Shared Prefrence List"),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Shared_Prefrences_List(),)
              );
            },
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Payment System"),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => payment(),)
              );
            },
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("notification"),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Notification_HomePage(),)
              );
            },
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Ads Mobile"),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Ad_Mobile_Page(),)
              );
            },
          ),
          Divider(),

          ListTile(
            leading: Icon(Icons.arrow_forward_ios),
            title: Text("Dog Api"),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => dog_home(),)
              );
            },
          ),
          Divider(),

        ],
      ),
    );
  }
}
