import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
   int age;
   String ? sex;
   int heigh;
   int weight;

  Result  ({
    required this.age,
   required this.weight,
    required this.heigh
    ,this.sex,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title : const Text('  Result ',style:  TextStyle(
          fontSize: 18,fontWeight: FontWeight.bold ,
        ),),

      ),
     body : SafeArea(
       child: Center(
         child: Column (
           children: [
             Text('  $sex  ',style: const  TextStyle(
               fontSize: 18,fontWeight: FontWeight.bold ,
             ),),
             const SizedBox(height: 7,),
             Text('  $heigh  ',style:  const TextStyle(
               fontSize: 18,fontWeight: FontWeight.bold ,
             ),),
             const SizedBox(height: 7,),
             Text('  $age  ',style:  const TextStyle(
               fontSize: 18,fontWeight: FontWeight.bold ,
             ),),
             const SizedBox(height: 7,),
             Text('  $weight  ',style: const TextStyle(
               fontSize: 18,fontWeight: FontWeight.bold ,
             ),),
           ],),
       ),
     )

    );
  }
}
