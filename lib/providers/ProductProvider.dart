import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_example/helpers/ApiHandler.dart';
import 'package:mvvm_example/helpers/error_handler.dart';
import 'package:mvvm_example/models/Products.dart';
import 'package:mvvm_example/resources/UrlResource.dart';

class ProductProvider with ChangeNotifier
{

  var isinsert=false;
  addProduct(obj) async
  {
    try {
      await ApiHandler.post(UrlResource.ADD_PRODUCT,body:jsonEncode(obj.toJson())).then((json){
        if(json["status"]=="yes")
        {
          isinsert=true;
        }
        else
        {
          isinsert=false;
        }
      });
    } on ErrorHandler catch (ex) {
      print(ex.getMessage());
      if(ex.getCode()==102)
      {
        Fluttertoast.showToast(
            msg: "No Internet Connection",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    }
  }

  List<Products> data=null;
  viewProduct() async
  {
    try {
      await ApiHandler.get(UrlResource.VIEW_PRODUCT).then((json){
        data = json.map<Products>((obj) => Products.fromJson(obj)).toList();
      });
      notifyListeners();
    } on ErrorHandler catch (ex) {
      print(ex.getMessage());
      if(ex.getCode()==102)
      {
        Fluttertoast.showToast(
            msg: "No Internet Connection",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0
        );
        //no internetzz
      }
      // else if(ex.code)
    }
  }
}