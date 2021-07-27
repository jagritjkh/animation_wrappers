import 'package:animated_button_bars/animated_button_bars.dart';
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

/// example for animated text bottom bar with all the animation wrappers
class AnimationWrappers extends StatefulWidget {
  @override
  _AnimationWrappersState createState() => _AnimationWrappersState();
}

class _AnimationWrappersState extends State<AnimationWrappers> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    FadedScaleContainer(),
    FadedSlideContainer(),
    FadeContainer(),
    ScaleContainer(),
  ];

  final List<BarItem> _barItems = [
    BarItem(
      label: "Faded Scale",
      iconData: Icons.linear_scale,
      activeColor: Colors.yellow,
    ),
    BarItem(
      label: "Faded Slide",
      iconData: Icons.slideshow,
      activeColor: Colors.red,
    ),
    BarItem(
      label: "Fade",
      iconData: Icons.blur_linear,
      activeColor: Colors.blue,
    ),
    BarItem(
      label: "Scale",
      iconData: Icons.horizontal_rule_rounded,
      activeColor: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Animation Wrappers',
          style: Theme.of(context).textTheme.headline6,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: AnimatedTextBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _barItems,
      ),
    );
  }
}

/// example of faded scale animation wrapper
class FadedScaleContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadedScaleAnimation(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.yellow,
        ),
      ),
    );
  }
}

/// example of faded slide animation wrapper
class FadedSlideContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FadedSlideAnimation(
      child: Container(
        height: 200,
        width: 200,
        color: Colors.red,
      ),
      beginOffset: Offset(0.7, 2),
      endOffset: Offset(0.5, 1),
    );
  }
}

/// example of fade animation wrapper
class FadeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeAnimation(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.blue,
        ),
      ),
    );
  }
}

/// example of scale animation wrapper
class ScaleContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleAnimation(
        child: Container(
          height: 200,
          width: 200,
          color: Colors.green,
        ),
      ),
    );
  }
}
