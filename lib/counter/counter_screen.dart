import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.greenAccent,
        title: Text("Counter Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("data",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600),),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(child: Icon(Icons.add)),
              CircleAvatar(child: Icon(Icons.horizontal_rule))
            ],
          )
        ],
      ),
    );
  }
}
