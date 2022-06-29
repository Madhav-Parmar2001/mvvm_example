import 'package:flutter/material.dart';
import 'package:mvvm_example/resources/StyleResources.dart';
import 'package:mvvm_example/widgets/PrimaryButton.dart';


class Register_Page extends StatefulWidget {
  @override
  Register_PageState createState() => Register_PageState();
}

class Register_PageState extends State<Register_Page> {

  GlobalKey _globalKey = GlobalKey();
  TextEditingController _name = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  var _gender = "male";
  _radioMethod(v){
    setState(() {
      _gender = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: aDefaultPadding,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: Form(
              key: _globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 120.0,
                  ),
                  Center(
                    child: Text(
                      "Create Account",
                      style: titleText,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: _name,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(
                        color: aTextFieldColor,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: aPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _contact,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Contact",
                      labelStyle: TextStyle(
                        color: aTextFieldColor,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: aPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _email,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: aTextFieldColor,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: aPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: aTextFieldColor,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: aPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Gender :",
                    style: subTitle,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "male",
                        groupValue: _gender,
                        onChanged: _radioMethod,
                        activeColor: Colors.blue,
                      ),
                      Container(
                        child: Text("Male"),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Radio(
                        value: "female",
                        groupValue: _gender,
                        onChanged: _radioMethod,
                        activeColor: Colors.blue,
                      ),
                      Container(
                        child: Text("Female"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PrimaryButton(
                      buttonText: "Register",
                      backcolor: Colors.green,
                      onclick: (){}
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
