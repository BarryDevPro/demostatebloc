import 'package:demostate/bloc/counter-state.dart';
import 'package:demostate/cubit/counter-state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBlocState())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomeBlocPage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomeBlocPage extends StatelessWidget {
  MyHomeBlocPage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  Widget build(BuildContext context) {
    print('build ....');
    return Scaffold(
      appBar: AppBar(

        title: Text(title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBlocState , int>(builder: (context , state){
              return Text(
                '$state',
                style: Theme.of(context).textTheme.headline4,
              );
            })
          ],
        ),
      ),
      floatingActionButton: Wrap(
        direction: Axis.vertical,
        spacing: 5,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: (){
              context.read<CounterBlocState>().add(CounterEvent.DECREMENT);
            },
            tooltip: 'Increment',
            child: Icon(Icons.remove ),
          ),
          FloatingActionButton(
            onPressed: (){
              context.read<CounterBlocState>().add(CounterEvent.INCREMENT);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),

        ],
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class MyHomeCubitPage extends StatelessWidget {
  MyHomeCubitPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    print('build ....');
    return Scaffold(
        appBar: AppBar(

          title: Text(title),
        ),
        body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterState , int>(builder: (context , state){
                return Text(
                  '$state',
                  style: Theme.of(context).textTheme.headline4,
                );
              })
            ],
          ),
        ),
        floatingActionButton: Wrap(
          direction: Axis.vertical,
          spacing: 5,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: (){
                context.read<CounterState>().decremet();
              },
              tooltip: 'Increment',
              child: Icon(Icons.remove ),
            ),
            FloatingActionButton(
              onPressed: (){
                context.read<CounterState>().incremet();
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),

          ],
        )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
