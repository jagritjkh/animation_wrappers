## [3.0.1+dev] - 2021-07-27
* Add new SlideAnimation
* update documentation

## [3.0.0] - 2021-07-27

* Breaking Change
    - Removed AnimatedTextBottomBar (you can now use animated_button_bars package for it).
* update: example

## [2.0.0] - 2021-07-22

* Breaking Change
    - In FadedSlideAnimation
        - change: durationInMilliseconds to fadeDuration and of type Duration
        - change: slideDurationInMilliseconds to slideDuration and of type Duration
        - rename: curve to fadeCurve

    - In FadedScaleAnimation
        - change: durationInMilliseconds to fadeDuration and of type Duration
        - rename: curve to fadeCurve

    - In AnimatedTextBottomBar
        - remove: activeColor from BottomBarItem and add: selectedItemColor to AnimatedTextBottomBar
        - remove: inactiveColor from BottomBarItem and add: unselectedItemColor to AnimatedTextBottomBar

* In AnimatedTextBottomBar
    - add: elevation
    - add: backgroundColor
    - add: shadowColor
    - add: selectedItemBorderRadius
    - add: padding
    - add: key
    - add: iconData in BottomBarItem
    - fix: margin and padding issues

* In FadedScaleAnimation
    - add: scaleDuration
    - add: scaleCurve
    - add: alignment for scale animation

* change: directory name of AnimatedBottomNavigationBars to animated_bottom_navigation_bars
* change: directory name of Animations to animations

* update: documentation
* add: fade animation (NEW)
* add: scale animation (NEW)
* add: textDirection in FadedSlideAnimation
* make: text nullable
* migrate: example to null safety
* update: example with animated text bottom bar and newly added animation wrappers

## [1.0.0] - 2021-07-04

* Breaking Change
  - Now, child is changes to required named parameter for animation wrappers
* update: example

## [0.0.5] - 2021-06-28

* fix: slideDurationInMilliseconds is now assigned to the animation

## [0.0.4] - 2021-03-18

* add textStyle, margin and borderRadius properties in animatedTextBottomBar
* make text and image property as required in BottomBarItem

## [0.0.3] - 2021-03-18

* add activeColor and inactiveColor property to bottom bar item

## [0.0.2] - 2021-03-17

* Migrate to null safety.
* file faded_transition_animation is renamed to faded_slide_animation

## [0.0.1] - 2021-03-06

* Animation Wrapper widgets, just wrap the child to be animated with this wrapper widget and that child will be animated.