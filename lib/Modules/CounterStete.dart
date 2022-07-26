import 'package:experiment_app/Modules/Counter_Cubit/cubit.dart';
import 'package:experiment_app/Modules/Counter_Cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit,MainState >(
        listener: (context, state) {
          if (state is PlusState){
            print ('plus ${state.Counter}');
          }
          else if (state is MinusState){
            print ('Minus ${state.Counter}');
          }
        },
        builder: (context,state)=> Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:  const Text ('Welcome mYaPP',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
          ),
          body: Center(
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(mainAxisSize: MainAxisSize.min,
                  children: [ FloatingActionButton(onPressed: (){
                    CounterCubit.get(context).plus();
                    },child: const Icon(Icons.add),mini: true),
                    const SizedBox(height: 15,),
                    const Text ('Plus',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ],),
                const SizedBox(width: 20,),
                Text ('${CounterCubit.get(context).Counter}',style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),),
                const SizedBox(width: 20,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [ FloatingActionButton(onPressed: (){
                    CounterCubit.get(context).minus();

                  },child: const Icon(Icons.minimize_outlined),mini: true),
                    const SizedBox(height: 15,),
                    const Text ('Minus',style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),),
                  ],),
              ],),
          ),

        ),
      ),
    );
  }
}
