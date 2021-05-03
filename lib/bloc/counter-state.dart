import 'package:bloc/bloc.dart';

enum CounterEvent{INCREMENT , DECREMENT}
class CounterBlocState extends Bloc<CounterEvent , int>{
  CounterBlocState() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    switch(event){
      case CounterEvent.INCREMENT: yield state+1; break;
      case CounterEvent.INCREMENT: {
        if(state > 0){
          yield state - 1;
        }else yield state;
      } break;

      default: yield state;
    }

  }
}