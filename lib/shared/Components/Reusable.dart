import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
  Widget DefaultTextField ({
  TextEditingController ? Textcontroller,
   required Function ontap,
   required Function validated,
    Function? Pressed,
    String ? labeled,
    IconData ? sufixed,
    required IconData  prefixed,
    TextInputType? Type,
    bool isShow=false,
  })=> TextFormField(

    keyboardType: Type,
    obscureText: isShow,
    controller: Textcontroller,
    onTap: (){ ontap();},
    validator: (s){ return validated(s);},
    decoration: InputDecoration (
      border: OutlineInputBorder(),
      label: Text (labeled!),
      suffixIcon: IconButton(onPressed: (){Pressed!();}, icon: Icon (sufixed)),
      prefixIcon: Icon (prefixed),

    ),
  );

  Widget DefaultButton ({
    bool   isUpperCase=true,
  required Function ONPressed ,
  required String Textt ,
  Color ? BackGround ,
  double ? width ,
})=> Container(
  decoration: BoxDecoration (borderRadius: BorderRadius.circular(30),
    color: BackGround!,),
  width: width!,

  child:   MaterialButton(onPressed: (){ONPressed();},
    child: Text (isUpperCase ? Textt.toUpperCase():Textt,
      style: const TextStyle(color: Colors.white,
    ),)  ,



  ),
) ;

  Widget ListScreen (Map Model)=>  Row(
    children: [
      CircleAvatar(
        radius: 40,
        child :
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
         children : [ Text('${Model['Id']}'),
         ] ),
      ),

      const SizedBox(width: 20,),
      Text('${Model['Title']}'),
      const SizedBox(width: 20,),
      Text('${Model['Time']}'),
      const SizedBox(height: 10,)
      ,Text('${Model['Date']}'),

    ],
  );


  Widget BuisinessDataList (article, context) =>Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 120,
            child: Image( image:NetworkImage('${article ['urlToImage']}'),fit: BoxFit.cover,  ))  ,
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text('${article ['title']}',style: Theme.of(context).textTheme.bodyText1,overflow: TextOverflow.ellipsis, maxLines: 3,),
                ),
                Text('${article ['publishedAt']}',style: TextStyle(
                  fontWeight:FontWeight.w600,color: Colors.grey,
                ),)


              ], ),
          ),
        ),
      ]);