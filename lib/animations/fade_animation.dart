import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// [FadeAnimation] is build using [FadeTransition]

/// fade animation wrapper widget
/// just wrap the child with this widget and widget will be animated
/// [child] : the widget to be animated
/// [duration] : duration of animation of fade (default: Duration(milliseconds: 1000))
/// [curve] : curve of the animation (default: [Curves.decelerate])
/// [controller] : animation controller of the animation (optional)
/// if you give your own controller, no need to dispose the controller
class FadeAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Curve curve;
  final AnimationController? controller;

  FadeAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.curve = Curves.decelerate,
    this.controller,
  }) : super(key: key);

  @override
  _FadeAnimationState createState() => _FadeAnimationState();
}

/// [SingleTickerProviderStateMixin] is used because ony one animation controller is being used for making [FadeAnimation].
class _FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late CurvedAnimation _animation;

  /// controller is initialised in [initState] with the values defined or received as parameters in the widget
  @override
  void initState() {
    super.initState();
    _initController();
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
    _controller.forward();
  }

  _initController() {
    var controller = widget.controller;
    if (controller != null) {
      _controller = controller;
    } else {
      _controller = AnimationController(duration: widget.duration, vsync: this)
        ..addListener(() {
          setState(() {});
        });
    }
  }

  /// animation controller is being disposed for safety
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
