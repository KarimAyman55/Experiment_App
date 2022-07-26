import 'package:experiment_app/Modules/Counter_Cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CounterCubit extends Cubit <MainState>{
  CounterCubit (): super (initState());
  static CounterCubit get (context)=> BlocProvider.of(context);
  int Counter =1;
  void plus (){
    Counter++;
    emit(PlusState(Counter));
  }
  void minus (){
    Counter--;
    emit(MinusState(Counter));
  }

}
