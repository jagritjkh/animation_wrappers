import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// [FadedScaleAnimation] is build using [FadeTransition] and [ScaleTransition]

/// fade and scale animation wrapper widget
/// just wrap the child with this widget and widget will be animated
/// [child] : the widget to be animated
/// [fadeDuration] : duration of animation of fade (default: Duration(milliseconds: 1000))
/// [scaleDuration] : duration of animation of scale (default: Duration(milliseconds: 500))
/// [fadeCurve] : curve of the animation (default: [Curves.decelerate])
/// [scaleCurve] : curve of the animation (default: [Curves.decelerate])
/// [alignment] : alignment of the scale animation (default: [Alignment.center])
class FadedScaleAnimation extends StatefulWidget {
  final Widget child;
  final Duration fadeDuration;
  final Duration scaleDuration;
  final Curve fadeCurve;
  final Curve scaleCurve;
  final Alignment alignment;

  FadedScaleAnimation({
    Key? key,
    required this.child,
    this.fadeDuration = const Duration(milliseconds: 1000),
    this.scaleDuration = const Duration(milliseconds: 500),
    this.fadeCurve = Curves.decelerate,
    this.scaleCurve = Curves.decelerate,
    this.alignment = Alignment.center,
  }) : super(key: key);

  @override
  _FadedScaleAnimationState createState() => _FadedScaleAnimationState();
}

/// [TickerProviderStateMixin] is used because two animation controllers are being used for making [FadedSlideAnimation].
class _FadedScaleAnimationState extends State<FadedScaleAnimation>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late CurvedAnimation _fadeAnimation;
  late AnimationController _scaleController;
  late CurvedAnimation _scaleAnimation;

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
    _fadeAnimation =
        CurvedAnimation(parent: _fadeController, curve: widget.fadeCurve);
    _fadeController.forward();
    _scaleController = AnimationController(
      duration: widget.scaleDuration,
      vsync: this,
    );
    _scaleAnimation =
        CurvedAnimation(parent: _scaleController, curve: widget.scaleCurve);
    _scaleController.forward();
  }

  /// animation controller is being disposed for safety
  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: widget.child,
        alignment: widget.alignment,
      ),
    );
  }
}
