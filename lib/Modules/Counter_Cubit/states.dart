import 'package:flutter/material.dart';
abstract class MainState {}
class initState extends MainState{}
class PlusState extends MainState{

  late  int ? Counter ;
  PlusState (this.Counter);
}
class MinusState extends MainState{

  late  int ? Counter ;
   MinusState( this.Counter);
}
