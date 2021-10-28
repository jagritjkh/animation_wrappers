import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// [SlideAnimation] is build using [SlideTransition]

/// fade and scale animation wrapper widget
/// just wrap the child with this widget and widget will be animated
/// [child] : the widget to be animated
/// [beginOffset] : the starting position of widget to be animated
/// [endOffset] : the ending position of widget to be animated
/// [duration] : duration of animation of fade and scale (default: Duration(milliseconds: 500))
/// [curve] : curve of the animation (default: [Curves.decelerate])
/// [textDirection] : direction of the text for slide animation (default: [TextDirection.ltr])
class SlideAnimation extends StatefulWidget {
  final Widget child;
  final Offset beginOffset;
  final Offset endOffset;
  final Duration duration;
  final Curve curve;
  final TextDirection textDirection;

  SlideAnimation({
    Key? key,
    required this.child,
    required this.beginOffset,
    required this.endOffset,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.decelerate,
    this.textDirection = TextDirection.ltr,
  }) : super(key: key);

  @override
  _SlideAnimationState createState() => _SlideAnimationState();
}

/// [SingleTickerProviderStateMixin] is used because ony one animation controller is being used for making [SlideAnimation].
class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  /// controller is initialised in [initState] with the values defined or received as parameters in the widget
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _offsetAnimation =
        Tween<Offset>(begin: widget.beginOffset, end: widget.endOffset).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve),
    );
    _controller.forward();
  }

  /// animation controller is being disposed for safety
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
      textDirection: widget.textDirection,
    );
  }
}
