import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvvm_example/widgets/MyProductListItem.dart';
import 'package:mvvm_example/helpers/ApiHandler.dart';
import 'package:mvvm_example/helpers/error_handler.dart';
import 'package:mvvm_example/models/Products.dart';
import 'package:mvvm_example/providers/ProductProvider.dart';
import 'package:mvvm_example/resources/UrlResource.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_example/views/product/AddProduct_Page.dart';
import 'package:mvvm_example/views/product/ViewSecondProduct.dart';
import 'package:provider/provider.dart';

import 'UpdateProduct_Page.dart';

class ViewProduct_Page extends StatefulWidget {
  @override
  ViewProduct_PageState createState() => ViewProduct_PageState();
}

class ViewProduct_PageState extends State<ViewProduct_Page> {


  ProductProvider provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context, listen: false);
    getdata();
  }

  getdata() async {
    await provider.viewProduct();
  }

  _showalert(pobj) async
  {
    AlertDialog alert = new AlertDialog(
      title: Text("Delete"),
      backgroundColor: Colors.blue.shade100,
      contentPadding: EdgeInsets.all(10),
      actions: [
        RaisedButton(
          child: Text("Edit"),
          onPressed: ()async {
            var pid = pobj.pid.toString();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => UpdateProduct_Page(upid: pid),)
            );
          },
        ),
        RaisedButton(
          child: Text("Yes"),
          onPressed: () async {
            try {
              var pid = pobj.pid.toString();
              Products obj = new Products(pid: pid,pname: "",pdescription: "",pimage: "",sprice: "",rprice: "");

              Uri url = Uri.parse(UrlResource.DELETE_PRODUCT);
              var response = await http.post(url, body: obj.toJson());
              if (response.statusCode == 200) {
                var body = response.body.toString();
                var json = jsonDecode(body);
                if (json["status"] == "yes"){
                  Navigator.of(context).pop();
                  provider.viewProduct();
                  Fluttertoast.showToast(
                      msg: "Record Delete",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
                else {
                  Fluttertoast.showToast(
                      msg: "Not delete",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
              }
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
          },
        ),
        RaisedButton(
          child: Text("No"),
          onPressed: () async{
            try {
                Navigator.of(context).pop();
                provider.viewProduct();
                Fluttertoast.showToast(
                    msg: "Not Delete Data",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
            }
            on ErrorHandler catch (ex) {
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
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProductProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text("MVVM View Product With API"),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>ViewSecondProduct())
            );
          }, icon: Icon(Icons.star))
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.plus_one),
        onPressed: ()
        {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=>AddProduct_Page())
          );
        },
      ),

      body: (provider.data!=null)?
          ListView.builder(
            itemCount: provider.data.length,
            itemBuilder: (context,index)
            {
              return MyProductListItem(
                pobj: provider.data[index],
                onclick: () async{
                  _showalert(provider.data[index]);
                },
              );
            },
          )
           :Center(child: CircularProgressIndicator()),
    );
  }
}
