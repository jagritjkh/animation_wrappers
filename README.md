# animation_wrappers

Animation Wrapper widgets, just wrap the child to be animated with this wrapper widget and that child will be animated. It also contains animated bottom navigation bars.

## Getting Started

To use this package, add `animation_wrappers` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Add dependency
```
dependencies:
  animation_wrappers: ^0.0.4
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
        color: Colors.red,
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

Many more animation wrappers and animated bottom bars will be added soon..!

Made with :heart: by Jagrit