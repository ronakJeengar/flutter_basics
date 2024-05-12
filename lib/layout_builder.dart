import 'package:flutter/material.dart';

class LayoutBuilderWidget extends StatelessWidget {
  const LayoutBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth > 600){
            return Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey,
                ),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.grey,
                )
              ],
            );
          } else{
            return Container(
              height: 200,
              width: 100,
              color: Colors.grey,
            );
          }
        },
      ),
    );
  }
}
