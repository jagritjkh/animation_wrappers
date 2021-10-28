import 'package:flutter/material.dart';

/// [ScaledSlideAnimation] is build using [ScaleTransition] and [SlideTransition]

/// fade and slide animation wrapper widget
/// just wrap the child with this widget and widget will be animated
/// [child] : the widget to be animated
/// [beginOffset] : the starting position of widget to be animated
/// [endOffset] : the ending position of widget to be animated
/// [scaleDuration] : duration of animation of scale (default: Duration(milliseconds: 500))
/// [slideDuration] : duration of animation of slide (default: Duration(milliseconds: 500))
/// [scaleCurve] : curve of the scale animation (default: [Curves.decelerate])
/// [slideCurve] : curve of the slide animation (default: [Curves.easeInOutSine])
/// [alignment] : alignment of the scale animation (default: [Alignment.center])
/// [textDirection] : direction of the text for slide animation (default: [TextDirection.ltr])
class ScaledSlideAnimation extends StatefulWidget {
  final Widget child;
  final Offset beginOffset;
  final Offset endOffset;
  final Duration scaleDuration;
  final Duration slideDuration;
  final Curve scaleCurve;
  final Curve slideCurve;
  final Alignment alignment;
  final TextDirection textDirection;

  ScaledSlideAnimation({
    Key? key,
    required this.child,
    required this.beginOffset,
    required this.endOffset,
    this.scaleDuration = const Duration(milliseconds: 500),
    this.slideDuration = const Duration(milliseconds: 500),
    this.scaleCurve = Curves.decelerate,
    this.slideCurve = Curves.easeInOutSine,
    this.alignment = Alignment.center,
    this.textDirection = TextDirection.ltr,
  }) : super(key: key);

  @override
  _ScaledSlideAnimationState createState() => _ScaledSlideAnimationState();
}

/// [TickerProviderStateMixin] is used because two animation controllers are being used for making [ScaledSlideAnimation].
class _ScaledSlideAnimationState extends State<ScaledSlideAnimation>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late CurvedAnimation _animation;
  late AnimationController _slideController;
  late Animation<Offset> _offsetAnimation;

  /// controllers are initialised in [initState] with the values defined or received as parameters in the widget
  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      duration: widget.scaleDuration,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _animation =
        CurvedAnimation(parent: _scaleController, curve: widget.scaleCurve);
    _scaleController.forward();
    _slideController = AnimationController(
      duration: widget.slideDuration,
      vsync: this,
    );
    _offsetAnimation =
        Tween<Offset>(begin: widget.beginOffset, end: widget.endOffset).animate(
      CurvedAnimation(parent: _slideController, curve: widget.slideCurve),
    );
    _slideController.forward();
  }

  /// both the animation controllers are being disposed for safety
  @override
  void dispose() {
    _scaleController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      alignment: widget.alignment,
      child: SlideTransition(
        position: _offsetAnimation,
        child: widget.child,
        textDirection: widget.textDirection,
      ),
    );
  }
}
