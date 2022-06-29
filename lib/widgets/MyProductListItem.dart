import 'package:flutter/material.dart';
import 'package:mvvm_example/models/Products.dart';

class MyProductListItem extends StatefulWidget {

  Products pobj;
  GestureTapCallback onclick;

  MyProductListItem({this.pobj,this.onclick});

  @override
  State<MyProductListItem> createState() => _MyProductListItemState();
}

class _MyProductListItemState extends State<MyProductListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.pobj.pname.toString()),
      subtitle: Text(widget.pobj.pdescription.toString()),
      trailing: Text(widget.pobj.sprice.toString()),
      leading: Text(widget.pobj.pid.toString()),
      onLongPress: widget.onclick,
    );
  }
}
