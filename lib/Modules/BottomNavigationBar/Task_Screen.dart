import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import '../../shared/Components/Reusable.dart';
import 'BottomNavigation_cubit.dart';
import 'BottomNavigation_states.dart';

class Task  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var Task = BottomCubit.get(context).Task ;
    return BlocConsumer <BottomCubit , MainBottomState>(
      listener: (context , state){},
      builder: (context , state){ return ListView.separated(
          itemBuilder: (context, index) => ListScreen(Task[index]),
          separatorBuilder:  (context, index) =>const SizedBox(height: 20,),
          itemCount: Task.length);
      },
    );

  }


}