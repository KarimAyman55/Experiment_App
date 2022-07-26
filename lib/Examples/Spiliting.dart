import 'package:flutter/material.dart';
Widget Spliting ({
  required Function function ,
  required Function validate,
  required TextEditingController control,
 TextInputType ? type,
  IconData ? prefix,
IconData ? suffix,
String ? label,
bool  obsecure = false,
  Function ? pressed ,
} ) => TextFormField(
  keyboardType: type,
decoration: InputDecoration(
  labelText: label,
border: InputBorder.none,
  prefixIcon: Icon(prefix),
  suffixIcon: IconButton(onPressed: (){pressed!();},icon: Icon (suffix)),
),
controller: control ,
obscureText: obsecure,
validator: (s){ return validate(s);},
onTap: (){ function();},
    );