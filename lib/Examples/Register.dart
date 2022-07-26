import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Spiliting.dart';
import 'package:experiment_app/shared/Components/Reusable.dart';
class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //const ({Key? key}) : super(key: key);
  var FormKey =GlobalKey<FormState>();

  var FristName =TextEditingController();

  var LastName =TextEditingController();

  var Gmail =TextEditingController();

  var Password =TextEditingController();

  var Phone =TextEditingController();

  bool isShow =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const  Text('Register Page',style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black54,
          fontSize: 20,
        ),),
      ),

     body: Center(
       child: Form(
         key: FormKey,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Spliting(
                 function: (){},
                 validate: (String v){
                   if (v.isEmpty){
                     return 'can not be empty';
                   }
                 },
                 control: FristName,
               label: 'Frist Name',
               type:  TextInputType.name,

             ),
             const SizedBox(height: 15,),
             Spliting(
                 function: (){},
                 validate: (String v){
                   if (v.isEmpty){
                     return 'can not be empty';
                   }
                 },
                 control: LastName,
               label: 'Last Name',
               type:  TextInputType.name,

             ),
             const SizedBox(height: 15,),
             Spliting(
                 function: (){},
                 validate: (String v){
                   if (v.isEmpty){
                     return 'can not be empty';
                   }
                 },
                 control: Gmail,
               label: 'Your Gmail',
               type:  TextInputType.emailAddress,
               prefix: Icons.email,
               //suffix: Icons.alternate_email_outlined,

             ),
             const SizedBox(height: 15,),
             Spliting(
               function: (){},
               validate: (String v){
                 if (v.isEmpty){
                   return 'can not be empty';
                 }
               },
               control: Password,
               label: 'Enter New Password',
               type:  TextInputType.visiblePassword,
               prefix: Icons.lock,
               suffix: isShow? Icons.visibility_off :Icons.visibility ,
               obsecure: isShow,
             pressed: (){
                 setState(() {

                 });
                 isShow=!isShow;
             }
             ),
             const SizedBox(height: 19,),

             DefaultButton(
               ONPressed: (){
                 if(FormKey.currentState!.validate())
                 {
                   print (FristName.text);
                   print (LastName.text);
                   print (Gmail.text);
                 }
               },
               Textt: 'Register Now',isUpperCase: false,
               BackGround: Colors.green,
               width: double.infinity,

             )
           ],),
       ),
     ),

    );
  }
}
