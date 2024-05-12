import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreWidgets extends StatefulWidget {
  const MoreWidgets({super.key});

  @override
  State<MoreWidgets> createState() => _MoreWidgetsState();
}

class _MoreWidgetsState extends State<MoreWidgets> {

  int num = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Text('More Widgets'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider.adaptive(
            onChanged: (double value) {
              setState(() {
                num = value as int;
                num++;
              });
            },
            value: double.parse(num.toString()),
          )
        ],
      ),
    );
  }
}
