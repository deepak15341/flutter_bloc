import 'package:bloc_practice/counter/counter_bloc/counter_event.dart';
import 'package:bloc_practice/counter/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text("Counter Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   "${context.watch<CounterBloc>().state}",
          //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          // ),

          BlocConsumer<CounterBloc, CounterState>(
            builder: (context, state) {
              if (state is CounterInitState) {
                return Text(
                  "${state.count}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                );
              } else if (state is CounterIncrementState) {
                return Text(
                  "${state.incrementCount}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                );
              } else if (state is CounterDecrementState) {
                return Text(
                  "${state.decrementCount}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                );
              } else {
                return Container();
              }
            },
            listener: (BuildContext context, state) {
              if (state is CounterIncrementState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Increment Tapped"),
                  ),
                );
              }
              else if(state is CounterDecrementState){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Decrement Tapped"),
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                  onTap: () {
                    BlocProvider.of<CounterBloc>(context).add(
                        CounterIncrementEvent(count: counterBloc.counter++));
                  },
                  child: CircleAvatar(child: Icon(Icons.add))),
              GestureDetector(
                  onTap: () {
                    // context.read<CounterBloc>().add(CounterDecrementEvent(count: counterBloc.counter--));
                    BlocProvider.of<CounterBloc>(context).add(
                        CounterDecrementEvent(count: counterBloc.counter--));
                  },
                  child: CircleAvatar(child: Icon(Icons.horizontal_rule)))
            ],
          )
        ],
      ),
    );
  }
}
