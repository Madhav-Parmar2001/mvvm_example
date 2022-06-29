import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'ViewDogBreed_Screen.dart';

class ViewDog_Screen extends StatefulWidget {

  @override
  State<ViewDog_Screen> createState() => _ViewDog_ScreenState();
}

class _ViewDog_ScreenState extends State<ViewDog_Screen> {

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

    Uri url = Uri.parse("https://dog.ceo/api/breeds/list/all");
    var response = await http.get(url);
    if(response.statusCode==200){
        var body = response.body;
        var json = jsonDecode(body);
        json['message'].forEach((breed,subbreed){
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
        title: Text("Dog List"),
      ),
      body: Center(
        child: isLoading?
        CircularProgressIndicator():
        ListView.builder(
            itemCount: dogsBreedList.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text(dogsBreedList[index]),
                onTap: (){
                  var dg = dogsBreedList[index];
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewDogBreed_Screen(breed: dg,)));
                },
              );
            }),
      ),
    );
  }
}
