
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared_Prefrences_List extends StatefulWidget {
  @override
  State<Shared_Prefrences_List> createState() => _Shared_Prefrences_ListState();
}

class _Shared_Prefrences_ListState extends State<Shared_Prefrences_List> {

  var _globalKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  final RegExp lettersonly = new RegExp(r'^[a-zA-Z0-9]+$');
  var whitedata = "";

  _listdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      whitedata = prefs.getStringList("data").toString();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shred_Prefrence String List"),
      ),
      body: Container(
        child: Column(
          children: [
            Form(
              key: _globalKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: name,
                    keyboardType: TextInputType.text,
                    validator: (vall){
                      if(vall.isEmpty)
                      {
                        return("Enter Value");
                      }
                      else if(!lettersonly.hasMatch(vall))
                      {
                        return "This Value Is Not Allowed";
                      }
                      return null;
                    },
                  ),
                  RaisedButton(
                    child: Text("Save"),
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();

                      if(_globalKey.currentState.validate())
                      {
                        var n = name.text.toString();
                        print("Value :"+n);

                        //syntex of string list
                        var createList = prefs.getStringList('data')?? [] ;
                        createList.add(name.text);
                        await prefs.setStringList('data', createList);
                        print(prefs.getStringList('data'));
                        name.text = "";
                        setState(() {
                          whitedata = prefs.getStringList("data").toString();
                        });
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Shared_Prefrences_List()));
                      }
                    },
                  ),
                ],
              ),
            ),

            Expanded(
              child: StreamBuilder(
                stream: Stream.periodic(Duration(seconds: 1)),
                builder: (context, snapshot){
                  String urlremoved = whitedata;
                  // List<String> spec_list = urlremoved.split(", ");
                  List<String> spec_list = urlremoved.split(", ");
                  int speclistlen = spec_list.length;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: speclistlen,
                    itemBuilder: (context, index){
                      return Card(
                        shadowColor: Colors.amber,
                        elevation: 4,
                        child: ListTile(
                          title: Text(spec_list[index]),
                          tileColor: Colors.blue.shade100,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
