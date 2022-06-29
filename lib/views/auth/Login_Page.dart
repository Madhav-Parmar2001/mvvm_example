// ignore: file_names
import 'package:flutter/material.dart';
import 'package:mvvm_example/resources/StyleResources.dart';
import 'package:mvvm_example/widgets/PrimaryButton.dart';
import 'Register_Page.dart';

class Login_Page extends StatefulWidget {

  @override
  State<Login_Page> createState() => Login_PageState();
}

class Login_PageState extends State<Login_Page> {
  GlobalKey _globalKey = GlobalKey();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  _loginform() {
    return Form(
      key: _globalKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120.0,
          ),
          Text(
            "Welcome Back",
            style: titleText,
          ),

          SizedBox(
            height: 5.0,
          ),
          Text(
            "New to this app?",
            style: subTitle,
          ),

          SizedBox(
            height: 10.0,
          ),
          // Text("Email"),
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
            height: 10.0,
          ),
          // Text("Password"),
          TextFormField(
            controller: _password,
            keyboardType: TextInputType.text,
            obscureText: true,
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
            height: 20.0,
          ),
          _loginbtn(),

          SizedBox(
            height: 20.0,
          ),
          Center(
            child: Text(
              "Or",
              style: textButton,
            ),
          ),

          SizedBox(
            height: 20.0,
          ),
          Center(
            child: TextButton(
              child: Text(
                "create Account",
                style: textButton,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Register_Page())
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _loginbtn()
  {
    return PrimaryButton(buttonText: "Login",backcolor: Colors.red,onclick: (){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: aDefaultPadding,
        child: SingleChildScrollView(
          child: _loginform(),
        ),
      ),
    );
  }
}