import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ViewImage.dart';

class ViewDogBreed_Screen extends StatefulWidget {

  var breed = "";
  ViewDogBreed_Screen({this.breed});

  @override
  State<ViewDogBreed_Screen> createState() => _ViewDogBreed_ScreenState();
}

class _ViewDogBreed_ScreenState extends State<ViewDogBreed_Screen> {

  List<String> dogsBreedList = List<String>();
  List<String> tempList = List<String>();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchDogsBreed();
  }

  _fetchDogsBreed() async{
    setState(() {
      isLoading = true;
    });
    tempList = List<String>();

    Uri url = Uri.parse("https://dog.ceo/api/breed/" +widget.breed+ "/images");
    var response = await http.get(url);
    if(response.statusCode==200){
      var body = response.body;
      var json = jsonDecode(body);
      json['message'].forEach((breed){
        tempList.add(breed.toString());
      });
    }

    setState(() {
      dogsBreedList = tempList;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog Country "+widget.breed),
      ),
      body: Center(
        child: isLoading?
        CircularProgressIndicator():
        ListView.builder(
            itemCount: dogsBreedList.length,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10,),
                child: GestureDetector(
                  child: FadeInImage.assetNetwork(
                    placeholder: "Asset/Images/bg.jpg",
                    image: dogsBreedList[index],
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    fit: BoxFit.fitHeight,
                  ),
                  onTap: (){
                    var dgs = dogsBreedList[index];
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => View_Image(dgimage: dgs)));
                  },
                ),
              );

            }),
      ),
    );
  }
}
