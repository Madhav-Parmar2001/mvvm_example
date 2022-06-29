import 'package:flutter/material.dart';
import 'package:mvvm_example/models/Archive.dart';

class MyArchiveitem extends StatefulWidget {

  Files obj;

  MyArchiveitem ({this.obj});

  @override
  State<MyArchiveitem> createState() => _MyArchiveitemState();
}

class _MyArchiveitemState extends State<MyArchiveitem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.obj.name.toString()),
      subtitle: Text(widget.obj.size.toString()),
      trailing: Text(widget.obj.format.toString()),
    );
  }
}
