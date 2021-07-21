import 'package:flutter/material.dart';

/// [FadedSlideAnimation] is build using [FadeTransition] and [SlideTransition]

/// fade and slide animation wrapper widget
/// just wrap the child with this widget and widget will be animated
/// [child] : the widget to be animated
/// [fadeDuration] : duration of animation of fade (default: Duration(milliseconds: 1000))
/// [slideDuration] : duration of animation of slide (default: Duration(milliseconds: 500))
/// [fadeCurve] : curve of the fade animation (default: [Curves.decelerate])
/// [slideCurve] : curve of the scale animation (default: [Curves.easeInOutSine])
/// [textDirection] : direction of the text for slide animation (default: [TextDirection.ltr])
class FadedSlideAnimation extends StatefulWidget {
  final Widget child;
  final Offset beginOffset;
  final Offset endOffset;
  final Duration fadeDuration;
  final Duration slideDuration;
  final Curve fadeCurve;
  final Curve slideCurve;
  final TextDirection textDirection;

  FadedSlideAnimation({
    Key? key,
    required this.child,
    required this.beginOffset,
    required this.endOffset,
    this.fadeDuration = const Duration(milliseconds: 1000),
    this.slideDuration = const Duration(milliseconds: 500),
    this.fadeCurve = Curves.decelerate,
    this.slideCurve = Curves.easeInOutSine,
    this.textDirection = TextDirection.ltr,
  }) : super(key: key);

  @override
  _FadedSlideAnimationState createState() => _FadedSlideAnimationState();
}

/// [TickerProviderStateMixin] is used because two animation controllers are being used for making [FadedSlideAnimation].
class _FadedSlideAnimationState extends State<FadedSlideAnimation>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late CurvedAnimation _animation;
  late AnimationController _slideController;
  late Animation<Offset> _offsetAnimation;

  /// controllers are initialised in [initState] with the values defined or received as parameters in the widget
  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: widget.fadeDuration,
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    _animation =
        CurvedAnimation(parent: _fadeController, curve: widget.fadeCurve);
    _fadeController.forward();
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
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: SlideTransition(
        position: _offsetAnimation,
        child: widget.child,
        textDirection: widget.textDirection,
      ),
    );
  }
}
