import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationWrappers(),
    );
  }
}

class AnimationWrappers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Wrappers'),
      ),
      body: Column(
        children: [
          FadedScaleAnimation(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.red,
            ),
          ),
          FadedSlideAnimation(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
            ),
            beginOffset: Offset(0.5, 2),
            endOffset: Offset(0.5, 1),
          ),
        ],
      ),
    );
  }
}
