import 'package:flutter/material.dart';
import 'package:mvvm_example/resources/StyleResources.dart';

class PrimaryButton extends StatefulWidget {

  var buttonText="";
  Color backcolor;
  GestureTapCallback onclick;
  PrimaryButton({this.buttonText,this.onclick,this.backcolor});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.08,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.backcolor,
          ),
          child: Text(
            widget.buttonText,
            style: StyleResources.primaryButtonStyle,
          ),
        ),
        onTap: widget.onclick
    );
  }
}
