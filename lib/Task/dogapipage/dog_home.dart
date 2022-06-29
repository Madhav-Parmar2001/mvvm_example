import 'package:flutter/material.dart';

import '../../views/dogapi/dog_websit_ready/mainpageofdogapi.dart';
import '../../views/dogapi/dogwebsitelistformet/ViewDog_Screen.dart';

class dog_home extends StatefulWidget {

  @override
  State<dog_home> createState() => _dog_homeState();
}

class _dog_homeState extends State<dog_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog_Home"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("(1) dogwebsitelistformet"),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ViewDog_Screen()),
              );
            },
          ),
          Divider(),

          ListTile(
            title: Text("(2) Dog Website Ready"),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => mainpageHomePage()),
              );
            },
          ),
          Divider(),


          
        ],
      ),
    );
  }
}
