import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';

class CounterState extends Cubit<int>{
  CounterState() : super(0);

  void incremet() => emit(state + 1);
  void decremet(){
    if(state > 0){
      emit(state - 1);
    }else emit(state);
  }
}