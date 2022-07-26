import 'dart:ffi';

import 'package:experiment_app/Modules/Bmi%20app/Result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Bmi extends StatefulWidget {
  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
 // const ({Key? key}) : super(key: key);
double height =120;
int age=20;
int weight =50;
bool isMale = true;
String ? Sex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(

  leading: const Padding(
    padding: EdgeInsetsDirectional.only(start: 10,bottom: 3),
    child: Text('  BMI  ',style:  TextStyle(
      fontSize: 18,fontWeight: FontWeight.bold ,
    ),),
  ),

),
      body: Column (
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                padding: const EdgeInsetsDirectional.only(start: 80.0,),

                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale =true;
                        Sex = 'male';
                      });
                    },

                    child:
                    Container(
                       child:  CircleAvatar(
                         child: const Text('MaLe',style:  TextStyle(
                          fontSize: 25,fontWeight: FontWeight.bold ,
                      ),),
                         backgroundColor: isMale ? Colors.green:Colors.grey[300],
                         radius: 60,
                       ),
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 80.0,),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isMale =false;
                        Sex = 'Female';
                      });
                    },
                    child:
                  Container(
                  child:  CircleAvatar(
                    child : const Text('FeMaLe',style:  TextStyle(
                      fontSize: 25,fontWeight: FontWeight.bold ,
                       ),),
                    backgroundColor: !isMale ? Colors.green:Colors.grey[300],
                    radius: 60,
                  ),
                      ),


                ))
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 5,
            decoration: const BoxDecoration(color: Colors.greenAccent),
          ),

          Expanded(child:
          Row(children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 90.0),
              child: Column(
                children: [
                  Padding(

                    padding: const EdgeInsets.only(top: 60.0),
                    child: Text('${height.toInt()}'),
                  ),
                  const SizedBox(height: 15,),

                  Container(
                    width: 300,
                    child: Slider(value: height, onChanged: (value){
                    setState(() {
                      height=value;
                      print (value.toInt());
                    });
                    }, max: 200,
                      min: 10,
             ),
                  ),
                ],
              ),
            )
          ],)),

          Container(
  width: double.infinity,
  height: 5,
  decoration: const BoxDecoration(color: Colors.greenAccent),
),


          Expanded(child: Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children : [

                    Padding(
                      padding: const EdgeInsetsDirectional.only(end: 40.0,top: 25),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Age',style: TextStyle(fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10,),
                          Text('$age',style: const TextStyle(fontWeight: FontWeight.bold),),

                        ],),
                    ),
                    const  SizedBox (height: 15,),
                    Row(
                      children: [
                        FloatingActionButton(onPressed: (){setState(() {
                          age++;
                        });} ,child: const Icon (Icons.add_circle_outlined),heroTag: 1),
                        const  SizedBox (width: 15,),
                        FloatingActionButton(onPressed: (){
                          setState(() {
                            age--;
                          });
                        } ,child: const Icon (Icons.minimize),heroTag: 2),

                      ],),

                  ]),
            ),
            const SizedBox(width: 100,),
            Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children : [

                  Padding(
                    padding: const EdgeInsetsDirectional.only(end: 40.0,top: 25),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Weight',style: TextStyle(fontWeight: FontWeight.bold),),
                        const SizedBox(height: 10,),
                        Text('$weight',style: const TextStyle(fontWeight: FontWeight.bold),),

                      ],),
                  ),
                  const  SizedBox (height: 15,),
                  Row(
                    children: [
                      FloatingActionButton(onPressed: (){setState(() {
                        weight++;
                      });} ,child: const Icon (Icons.add_circle_outlined),heroTag: 3),
                      const  SizedBox (width: 15,),
                      FloatingActionButton(onPressed: (){
                        setState(() {
                          weight--;
                        });
                      } ,child: const Icon (Icons.minimize),heroTag: 4),

                    ],),

                ]),

            ],)),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.green),
            child: MaterialButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
              Result(age: age  , weight: weight, heigh: height.toInt(),sex:Sex ,)
              ));
            }
            ,child: const Text ('CALCULATE',
                style: TextStyle(fontWeight:FontWeight.bold ,color: Colors.white60),),),
          )

        ],) ,


    );
  }
}
