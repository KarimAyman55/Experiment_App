import 'package:experiment_app/Modules/BottomNavigationBar/BottomNavigation_states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:experiment_app/Modules/Login_page.dart';

class BottomCubit extends Cubit<MainBottomState> {
  BottomCubit () : super (InitialBottom());
  static BottomCubit get(context) => BlocProvider.of(context);
 //BottomNavCubit
   var DataBase ;
  bool isShow =true;
  IconData FloatingIcon =Icons.add;
  Map Task ={};
  int  indexed =0;
   ChangeNav( index) {
    indexed = index ;
    emit(ChangeBottomNav());
   }
  ChangeIcon (
  {required IconData FabIcon ,required bool isShowen }
      ){
    FloatingIcon = FabIcon  ;
    isShow = isShowen  ;
     emit(ChangeIconState());

  }
   //DataBaseCubit
  Future createDataBase  ( ) async {
    DataBase =  await openDatabase('TODO.dp',version :1
      ,onCreate: (database,version){
        database.execute('CREATE TABLE task (Id INTEGER.Primary Key,Title TEXT, Date TEXT ,Time TEXT )');},
      onOpen: (database){
        print ('opened');
      getDataBase(DataBase).then((v) { Task =  v as Map ;
      print (Task);
      emit( GetDP());
      });

      },
    ).then(
            (value) {
          DataBase =value;
          print ( 'created');
          emit( CreateDP());
        });
  }

   insertData ({
     required String Title,
  required String Date,
  required String Time,
})async{
    await DataBase!.transaction((txn){ txn.rawInsert('INSERT INTO task (Title , Date ,Time)'
        ' VALUES ($Title , $Date , $Time)');}).then(
            (value) { print ('inserted');
        emit( InsertDP());
        });
    var Ta = getDataBase(DataBase).then((v) { Task =  v as Map ;
    emit( GetDP()); });
    print (Ta);
  }

   Future  getDataBase (DataBase)async{
     return await  DataBase.rawQyery("SELECT * FROM task" ).then(
             (value) { print (value);
         emit( GetDP());
         });

   }
}