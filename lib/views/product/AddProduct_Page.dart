import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mvvm_example/helpers/ApiHandler.dart';
import 'package:mvvm_example/helpers/error_handler.dart';
import 'package:mvvm_example/models/Products.dart';
import 'package:mvvm_example/providers/ProductProvider.dart';
import 'package:mvvm_example/resources/UrlResource.dart';
import 'package:provider/provider.dart';
import 'ViewProduct_Page.dart';

class AddProduct_Page extends StatefulWidget
{
  @override
  AddProduct_PageState createState() => AddProduct_PageState();
}

class AddProduct_PageState extends State<AddProduct_Page>
{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ProductProvider provider;
  TextEditingController product_name = TextEditingController();
  TextEditingController product_descrption = TextEditingController();
  TextEditingController product_rprice = TextEditingController();
  TextEditingController product_sprice = TextEditingController();

  PickedFile _imageFile = null;
  File _image = null;

  _getCamera()async{
    final _pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      _imageFile = _pickedFile;
      _image = File(_imageFile.path);
    });
  }

  _gatGallery()async{
    final _pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _imageFile = _pickedFile;
      _image = File(_imageFile.path);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ProductProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MVVM Add Product With API"),),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(5),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 5,),
                TextFormField(
                    controller: product_name,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Name",
                      hintText: "Enter Name",
                    )
                ),
                SizedBox(height: 15,),
                TextFormField(
                    controller: product_descrption,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Description",
                      hintText: "Enter Description",
                    )
                ),
                SizedBox(height: 15,),
                TextFormField(
                    controller: product_rprice,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Retail Price",
                      hintText: "Enter Retail Price",
                    )
                ),
                SizedBox(height: 15,),
                TextFormField(
                    controller: product_sprice,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Selling Price",
                      hintText: "Enter Selling Price",
                    )
                ),

                SizedBox(height: 20),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(400),
                    child: (_image!=null)
                        ?Image.file(_image,height: 150,width: 150,fit: BoxFit.cover,)
                        :Image.asset("Assets/Images/Upload_Your_Photo.jpg",height: 150,width: 150,fit: BoxFit.cover,),
                  ),
                ),

                SizedBox(height: 20),
                Row(
                  children: [
                    SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        child: Text("Camera"),
                        onPressed: (){
                          _getCamera();
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        child: Text("Gallery"),
                        onPressed: (){
                          _gatGallery();
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15,),
                RaisedButton(
                  color: Colors.blue,
                  child: Text("Submit"),
                  onPressed: () async{
                    var name = product_name.text.toString();
                    var description = product_descrption.text.toString();
                    var rprice = product_rprice.text.toString(); // Retail Price (Mrp)
                    var sprice = product_sprice.text.toString(); // Selling Price (Discount Price)

                    List<int> imageBytes = _image.readAsBytesSync();
                    String base64Image = base64Encode(imageBytes);

                    Products obj = new Products(
                        pid: "",
                        pname: name,
                        pdescription: description,
                        rprice: rprice,
                        sprice: sprice,
                        pimage: base64Image
                    );

                    await provider.addProduct(obj);
                    if(provider.isinsert)
                      {
                        Fluttertoast.showToast(
                            msg: "Record Inserted",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                        product_name.text = "";
                        product_descrption.text = "";
                        product_rprice.text = "";
                        product_sprice.text = "";

                        provider.viewProduct();
                        Navigator.of(context).pop();

                       // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ViewProduct_Page()));
                      }
                    else
                      {
                        Fluttertoast.showToast(
                            msg: "Record Not Inserted",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
