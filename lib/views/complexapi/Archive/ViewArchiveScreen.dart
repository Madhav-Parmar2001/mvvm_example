import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_example/models/Archive.dart';
import 'package:mvvm_example/widgets/Complex_API/MyArchiveitem.dart';

class ViewArchiveScreen extends StatefulWidget {
  @override
  State<ViewArchiveScreen> createState() => _ViewArchiveScreenState();
}

class _ViewArchiveScreenState extends State<ViewArchiveScreen> {

  var title="";

  Archive data=null;

  getdata() async {
    Uri url = Uri.parse("https://archive.org/metadata/TheAdventuresOfTomSawyer_201303");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var body = response.body.toString();
      var json = jsonDecode(body);
      print(json.toString());
      setState(() {
        data = Archive.fromJson(json);
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
        title: (data!=null)?Text(data.created.toString()):Center(child: CircularProgressIndicator()),
      ),
      body: (data!=null)?ListView.builder(
        itemCount: data.files.length,
        itemBuilder: (context, index)
        {

          return MyArchiveitem(obj: data.files[index]);

          // return ListTile(
          //   title: Text(data.files[index].name.toString()),
          //   subtitle: Text(data.files[index].size.toString()),
          // );
        },
      )

          :Center(child: CircularProgressIndicator()),
    );
  }
}
