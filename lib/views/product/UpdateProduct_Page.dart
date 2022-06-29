// ignore: file_names
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:mvvm_example/models/Products.dart';
import 'package:mvvm_example/resources/UrlResource.dart';
import 'ViewProduct_Page.dart';

class UpdateProduct_Page extends StatefulWidget
{
  var upid="";
  UpdateProduct_Page({this.upid});

  @override
  UpdateProduct_PageState createState() => UpdateProduct_PageState();
}

class UpdateProduct_PageState extends State<UpdateProduct_Page>
{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  var imagename="";


  getdata() async
  {
    // try {
    //   await ApiHandler.get(UrlResource.VIEW_PRODUCT).then((json){
    //     data = json.map<Products>((obj) => Products.fromJson(obj)).toList();
    //   });
    //   notifyListeners();
    // } on ErrorHandler catch (ex) {
    //   print(ex.getMessage());
    //   if(ex.getCode()==102)
    //   {
    //     Fluttertoast.showToast(
    //         msg: "No Internet Connection",
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.CENTER,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.green,
    //         textColor: Colors.white,
    //         fontSize: 16.0
    //     );
    //     //no internetzz
    //   }
    //   // else if(ex.code)
    // }
    Uri url = Uri.parse(UrlResource.SINGLE_PRODUCT);
    var response = await http.post(url,body: {"pid":widget.upid});
    if (response.statusCode == 200) {
      var body = response.body.toString();
      var json = jsonDecode(body);

      Products obj = Products.fromJson(json);

      setState(() {
        product_name.text = obj.pname.toString();
        product_descrption.text = obj.pdescription.toString();
        product_rprice.text = obj.rprice.toString();
        product_sprice.text = obj.sprice.toString();
        imagename= obj.pimage.toString();
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
      appBar: AppBar(title: Text("MVVM Edit Product With API"),),
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
                        :Image.network(UrlResource.BASE_URL +
                        "uploads/" + imagename,height: 150,width: 150,fit: BoxFit.cover,),
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

                    String base64Image="";

                    if(_image==null)
                      {
                        base64Image="";
                      }
                    else
                      {
                        List<int> imageBytes = _image.readAsBytesSync();
                        base64Image = base64Encode(imageBytes);
                      }


                    // Products obj = new Products(pid: widget.upid,pname: name,pdescription: description,pimage: base64Image,sprice: sprice,rprice: rprice);

                    Uri url = Uri.parse(UrlResource.UPDATE_PRODUCTMVVM);
                    var response = await http.post(url,body: {
                      "name":name,
                      "description":description,
                      "rprice":rprice,
                      "sprice":sprice,
                      "image":base64Image,
                      "oldimage":imagename,
                      "pid":widget.upid
                    });
                    // var response = await http.post(url,body: obj.toJson());
                    
                    // 200 OK,400 NOT FOUND,500 SERVER

                    if(response.statusCode==200)
                    {
                      var body = response.body.toString();
                      var json = jsonDecode(body);
                      if(json["status"]=="yes")
                        {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ViewProduct_Page()),
                          );
                        }
                    }
                    else
                    {
                      print("ERROR");
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
