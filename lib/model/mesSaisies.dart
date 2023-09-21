import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mesSaisies extends StatelessWidget {
   TextInputType type;
  TextEditingController controller;
  String hintName;
  Widget icon;
  bool obscure;


  mesSaisies({required this.controller, required this.hintName, required this.icon, this.obscure = false, this.type = TextInputType.text});



  @override
  Widget build(BuildContext context) {
      return Container(
        child:  TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius:  BorderRadius.circular(50),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.grey[200], filled: true,
              hintText: hintName,
              prefixIcon: icon
          ),
          keyboardType: type,
          obscureText:obscure ,
        ) ,
      );

  }
}
