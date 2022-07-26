import 'package:experiment_app/Examples/NavigattionBar/MainState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Cubit.dart';
class Navigation extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
//bool mode =false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigatorCubit,MainState>(
      listener: (context, state) {},
      builder: (context ,state){
      var cubit = NavigatorCubit.get(context);
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:const  Text(' App Page ',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
          actions: [
            IconButton(
                onPressed: (){

                },
                icon: const Icon(Icons.search)) ,
            IconButton(onPressed: (){
              cubit.ChangeSelectedMode();

              //cubit.SelectMode !=cubit.SelectMode;
            },
                icon:const Icon(Icons.brightness_6))

            ],
        ),

        body:cubit.Screens[cubit.Index],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(label: 'Business' ,icon: Icon(Icons.task_alt_outlined) ),
            BottomNavigationBarItem(label: 'Sports' ,icon: Icon(Icons.mark_chat_read) ),
            BottomNavigationBarItem(label: 'Add' ,icon: Icon(Icons.add_circle_outline) ),
            BottomNavigationBarItem(label: 'Setting' ,icon: Icon(Icons.settings) ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: cubit.Index,
          onTap: (num){
            cubit.Changer(num);
          },
        ),
      );
      } ,
    );
  }
}
