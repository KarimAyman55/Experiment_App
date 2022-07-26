import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Examples/NavigattionBar/Cubit.dart';
import '../Examples/NavigattionBar/MainState.dart';
import '../shared/Components/Reusable.dart';
class Sports extends StatelessWidget {
  //const ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <NavigatorCubit,MainState>(
      listener :(context , state){

      },
      builder: (context , state ){
        var ListSportsItem = NavigatorCubit.get(context).SportsData ;
        return  Scaffold(
          /*appBar:
        AppBar(
          centerTitle: true,
          title: const Text ('Business Page',style: TextStyle(
            fontWeight:FontWeight.bold,
          ),),
        ),*/

            body:   ListSportsItem.length > 0   ? ListView.separated(itemBuilder:  (context, index) =>
                BuisinessDataList(ListSportsItem[index],context),
                separatorBuilder: (BuildContext context,index) => SizedBox(height: 15,) ,
                itemCount: ListSportsItem.length):Center(child: CircularProgressIndicator())


          // Center(child: CircularProgressIndicator())
        );
      },


    );
  }
}
