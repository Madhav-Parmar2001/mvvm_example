import 'package:flutter/material.dart';
import 'package:mvvm_example/models/Astro.dart';

class MyListItem extends StatefulWidget {

  Dataseries obj;

  MyListItem({this.obj});

  @override
  State<MyListItem> createState() => _MyListItemState();
}

class _MyListItemState extends State<MyListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.obj.timepoint.toString()),
      subtitle: Text(widget.obj.wind10m.direction.toString()),
    );
  }
}
