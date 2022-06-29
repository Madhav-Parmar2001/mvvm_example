import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_example/models/Astro.dart';
import 'package:mvvm_example/widgets/Complex_API/MyListItem.dart';


class ViewAstroScreen extends StatefulWidget {

  @override
  State<ViewAstroScreen> createState() => _ViewAstroScreenState();
}

class _ViewAstroScreenState extends State<ViewAstroScreen> {

  var title="";

  Astro data=null;

  getdata() async {
    Uri url = Uri.parse("https://www.7timer.info/bin/astro.php?lon=113.2&lat=23.1&ac=0&unit=metric&output=json&tzshift=0");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var body = response.body.toString();
      var json = jsonDecode(body);
      print(json.toString());
      setState(() {
        data = Astro.fromJson(json);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (data!=null)?Text(data.product.toString()+"-"+data.init.toString()):Text("Loading..."),
      ),
      body: (data!=null)?ListView.builder(
        itemCount: data.dataseries.length,
        itemBuilder: (context,index)
        {
          return MyListItem(obj: data.dataseries[index]);


          // return ListTile(
          //   title: Text(data.dataseries[index].timepoint.toString()),
          //   subtitle: Text(data.dataseries[index].wind10m.direction.toString()),
          // );
        },
      ):Center(child: CircularProgressIndicator()),
    );
  }
}
