import 'package:flutter/material.dart';

class View_Image extends StatefulWidget {

  var dgimage = "";
  View_Image({this.dgimage});

  @override
  State<View_Image> createState() => _View_ImageState();
}

class _View_ImageState extends State<View_Image> {

  List<String> dogsBreedList = List<String>();
  List<String> tempList = List<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image "),
      ),
      body: Container(
        child: Image.network(widget.dgimage,fit: BoxFit.contain,),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10,),
      ),
    );
  }
}
