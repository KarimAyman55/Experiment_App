import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared/Components/Reusable.dart';
class MyLogin extends StatefulWidget {

  @override
  State<MyLogin> createState() => StateLogin();
}

class StateLogin extends State<MyLogin> {
  bool isPass= true;
  var FormKey = GlobalKey<FormState>();
  var emailcontroll=TextEditingController();
  var passcontroll=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: const Text ('Welcome onSellBuy',style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),),

      actions:const [
         Padding(
           padding: EdgeInsetsDirectional.only(end: 6),
           child: Icon (Icons.shopping_cart_outlined,size: 35,),
         )

      ],),
      body: Form(
        key: FormKey,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextField(
                validated: (String value){
                  if (value.isEmpty){
                    return 'Email Must Not Empty';
                  }
                } , Type: TextInputType.emailAddress,
                prefixed: Icons.email,
                labeled: ('Enter Your Email'),
                ontap: (){} ,
                Textcontroller:emailcontroll ,
              ),
              const SizedBox(height: 15),
              DefaultTextField(
                validated: (String value){
                  if (value.isEmpty){
                    return 'pass Must Not Empty';
                  }
                } ,
                  Type: TextInputType.visiblePassword,
                prefixed: Icons.lock,
                labeled: ('Enter Your password'),
                ontap: (){} ,
                isShow: isPass,
                sufixed: isPass ? Icons.visibility_off:Icons.visibility_outlined,

                Textcontroller:passcontroll ,
                Pressed: (){
                  setState(() {
                    isPass=!isPass;
                  });

                },
              ),
              const SizedBox(height: 17,),
              DefaultButton(
                isUpperCase: true,
                ONPressed: (){
                  if (FormKey.currentState!.validate()){
                   print (emailcontroll.text);
                   print (passcontroll.text);
                  }
                },

                Textt: ('LOGIN'),
                BackGround: Colors.green,
                width: double.infinity,

              ),
              const SizedBox(height: 18,),
              const Text ('Don\'t Have Account?',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                  ,color: Colors.black
              ),),
              const SizedBox(height: 2,),
              TextButton(onPressed: (){}, child:const Text ('        REGISTER NOW',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                  ,color: Colors.green
              ),),
              )



            ],),
        ),
      ),
    );
  }
}


