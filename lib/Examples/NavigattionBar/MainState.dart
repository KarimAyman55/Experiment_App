import 'package:flutter/material.dart';
class MainState {}
class InitState extends MainState {}
class ChangeState extends MainState {}
class GetBusinessSuccess extends MainState {}
class GetBusinessError extends MainState {
   var error_1;
  GetBusinessError(this.error_1);
}
class GetBusinessLoading extends MainState {}
class GetSportsSuccess extends MainState {}
class GetSportsError extends MainState {
  var error_2;
  GetSportsError(this.error_2);
}
class GetSportsLoading extends MainState {}
class ChangeMode extends MainState {}
