# animation_wrappers

Animation Wrapper widgets, just wrap the child to be animated with this wrapper widget and that child will be animated.

## Getting Started

To use this package, add `animation_wrappers` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## :star_struck: :heart_eyes: **Major Update** :heart_eyes: :star_struck:

See example for all animation wrappers

## Add dependency
```
dependencies:
  animation_wrappers: ^2.0.0
```

## Import
```
import 'package:animation_wrappers/animation_wrappers.dart';
```

## Usage: FadedScaleAnimation
```
FadedScaleAnimation(
    Container(
        height: 200,
        width: 200,
        color: Colors.blue,
    ),
),
```
## Usage: FadedSlideAnimation
```
FadedSlideAnimation(
    Container(
        height: 200,
        width: 200,
        color: Colors.blue,
    ),
    beginOffset: Offset(0.5, 2),
    endOffset: Offset(0.5, 1),
),
```
## Usage: FadeAnimation
```
FadeAnimation(
    child: Container(
        height: 200,
        width: 200,
        color: Colors.blue,
    ),
),
```
## Usage: ScaleAnimation
```
ScaleAnimation(
    child: Container(
        height: 200,
        width: 200,
        color: Colors.blue,
    ),
),
```

Many more animation wrappers will be added soon..!

Made with :heart: by Jagrit