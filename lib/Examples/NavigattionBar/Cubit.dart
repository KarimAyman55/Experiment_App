import 'package:experiment_app/Examples/NavigattionBar/MainState.dart';
import 'package:experiment_app/Models/Business.dart';
import 'package:experiment_app/Models/ADD.dart';
import 'package:experiment_app/Models/Setting.dart';
import 'package:experiment_app/Models/Sports.dart';
import 'package:experiment_app/Network/Remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'Network/Remote/dio_helper.dart';
class NavigatorCubit extends Cubit<MainState> {
  NavigatorCubit() : super(InitState());

 // NavigatorCubit (): super(InitState());
var error_1;
var error_2;
bool SelectMode =false;
  static NavigatorCubit get(context) => BlocProvider.of(context);
  List <Widget>Screens =[
    Business(),
    Sports(),
    Add(),
    Setting()
  ];
  int Index = 0;
  Changer (num){
    Index=num;
emit(ChangeState());
  }
  void ChangeSelectedMode (){
    SelectMode =!SelectMode;
   emit(ChangeMode()) ;
  }
  List<dynamic> BusinessData =[];
  List<dynamic> SportsData =[];

  void getBusiness (){
  emit(GetBusinessLoading());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country' : 'eg',
      'category':'business',
      'apiKey': 'ee2a7824476e41788177288a8ce5d16e'
    } ).then((value) {
     BusinessData=value?.data['articles'] ;
     // print (BusinessData [1]['title']);

      emit(GetBusinessSuccess());
    }).catchError( ( error) {
      print ( error.toString()) ;
      emit(GetBusinessError( error_1.toString()));
    });

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7abdbcab64b94170ba9c91c19201c7af
  //https://pbs.twimg.com/media/FT4LbWmWQAAz1j9.jpg
  }
void getSporsts (){
  emit(GetSportsLoading());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country' : 'eg',
      'category':'sports',
      'apiKey': 'ee2a7824476e41788177288a8ce5d16e'
    } ).then((value) {
     SportsData=value?.data['articles'] ;
     // print (BusinessData [1]['title']);

      emit(GetSportsSuccess());
    }).catchError( ( error) {
      print ( error.toString()) ;
      emit(GetSportsError( error_2.toString()));
    });









//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=7abdbcab64b94170ba9c91c19201c7af
  //https://pbs.twimg.com/media/FT4LbWmWQAAz1j9.jpg
  }
}
