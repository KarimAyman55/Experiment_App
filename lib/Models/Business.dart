import 'package:experiment_app/Examples/NavigattionBar/Cubit.dart';
import 'package:experiment_app/Examples/NavigattionBar/MainState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../shared/Components/Reusable.dart';
class Business extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NavigatorCubit,MainState>(
      listener :(context , state){

      },
      builder: (context , state ){
        var ListBusinessItem = NavigatorCubit.get(context).BusinessData ;
        return  Scaffold(
          /*appBar:
        AppBar(
          centerTitle: true,
          title: const Text ('Business Page',style: TextStyle(
            fontWeight:FontWeight.bold,
          ),),
        ),*/

          body:   ListBusinessItem.length > 0   ? ListView.separated(itemBuilder:  (context, index) =>
              BuisinessDataList(ListBusinessItem[index],context),
        separatorBuilder: (BuildContext context,index) => SizedBox(height: 15,) ,
        itemCount: ListBusinessItem.length):Center(child: CircularProgressIndicator())


           // Center(child: CircularProgressIndicator())
        );
      },


    );
  }
}
