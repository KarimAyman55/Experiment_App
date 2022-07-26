import 'package:experiment_app/Modules/BottomNavigationBar/Archived_Screen.dart';
import 'package:experiment_app/Modules/BottomNavigationBar/Done_Screen.dart';
import 'package:experiment_app/Modules/BottomNavigationBar/Task_Screen.dart';
import 'package:experiment_app/Modules/BottomNavigationBar/BottomNavigation_cubit.dart';
import 'package:experiment_app/Modules/Counter_Cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import '../../shared/Components/Reusable.dart';
import 'BottomNavigation_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class BottomNavigated extends StatelessWidget {
 List  <Widget> Screeens =[
   Task(),
   Done(),
   Archived()
 ];
  var ScafKey = GlobalKey<ScaffoldState>();
 var FormKey = GlobalKey<FormState>();
 var timecontroll=TextEditingController();
 var Titlecontroll=TextEditingController();
 var datecontroll=TextEditingController();

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
      create: (BuildContext context) =>BottomCubit()..createDataBase(),
      child: BlocConsumer< BottomCubit , MainBottomState>(
          listener: ( context ,  state)  {
            if (state is InsertDP){
              Navigator.pop(context);

            }
        },
        builder : (context,state){
          var cubitBar = BottomCubit.get(context);
            return Scaffold(
          key: ScafKey,
          //backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.green,
            elevation: 20,
            title: const Text ('Welcome onMyApp (:',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),

          ),
          body: SafeArea( child: Screeens[cubitBar.indexed],

          ), floatingActionButton:FloatingActionButton(
              onPressed: (){

                if (cubitBar.isShow) {
                  ScafKey.currentState?.showBottomSheet((context) =>
                      Form(
                        key: FormKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DefaultTextField(
                              ontap: (){},
                              Textcontroller: Titlecontroll,
                              prefixed: Icons.shopping_cart_outlined,
                              validated: (String v) {
                                if (v.isEmpty) {
                                  return 'must be empty';
                                }
                              },
                              labeled: 'task here',
                            ),
                            SizedBox(height: 15,),
                            DefaultTextField(
                              Textcontroller: timecontroll,
                              prefixed: Icons.watch,
                              validated: (String v) {
                                if (v.isEmpty) {
                                  return 'must be empty';
                                }
                              },
                              ontap: () {
                                showTimePicker(
                                    context: context, initialTime: TimeOfDay.now())
                                    .then((value) {
                                  timecontroll.text =
                                      value!.format(context).toString();
                                });
                              },
                              labeled: 'time here',
                            ),
                            SizedBox(height: 15,),
                            DefaultTextField(
                              Textcontroller: datecontroll,
                              prefixed: Icons.calendar_today,
                              validated: (String v) {
                                if (v.isEmpty) {
                                  return 'must be empty';
                                }
                              },
                              ontap: () {
                                showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2022-10-04')).then((value) {
                                  datecontroll.text= DateFormat.yMMMd().format(value!).toString();
                                });
                              },
                              labeled: 'Date here',
                            ),

                          ],),

                      )
                  ).closed.then((value) {

                    cubitBar.FloatingIcon;
                    cubitBar.isShow=true;
                  });
                  cubitBar.ChangeIcon(FabIcon: Icons.edit, isShowen: false);

                }
                else {
                  if (FormKey.currentState!.validate()) {
                    cubitBar.insertData( Title: Titlecontroll.text ,Date: datecontroll.text , Time: timecontroll.text);
                    cubitBar.getDataBase(cubitBar.DataBase);

                    Navigator.pop(context);

                    cubitBar.ChangeIcon(FabIcon: Icons.add, isShowen: true);

                  }}
              },
              child:  Icon (cubitBar.FloatingIcon),
            ),
          bottomNavigationBar: BottomNavigationBar(
            items:const [
              BottomNavigationBarItem  (icon:  Icon (Icons.add) ,label: 'Add Task'),
              BottomNavigationBarItem  (icon:  Icon (Icons.done) ,label: 'Done'),
              BottomNavigationBarItem  (icon:  Icon (Icons.archive  ),label: 'Archived')
            ],

            currentIndex:cubitBar.indexed,
            onTap: (indexx){
              cubitBar.ChangeNav(indexx);
                },
          ),

        );},
      )

    );

  }}

