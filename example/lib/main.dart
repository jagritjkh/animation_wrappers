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

  final List<BottomBarItem> _barItems = [
    BottomBarItem(
      text: "Faded Scale",
      iconData: Icons.linear_scale,
    ),
    BottomBarItem(
      text: "Faded Slide",
      iconData: Icons.slideshow,
    ),
    BottomBarItem(
      text: "Fade",
      iconData: Icons.blur_linear,
    ),
    BottomBarItem(
      text: "Scale",
      iconData: Icons.horizontal_rule_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Wrappers'),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: AnimatedTextBottomBar(
        onBarTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _barItems,
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
          color: Theme.of(context).primaryColor,
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
        color: Theme.of(context).primaryColor,
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
          color: Theme.of(context).primaryColor,
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
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
