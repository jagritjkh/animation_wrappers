import 'package:flutter/material.dart';

///animated bottom navigation bar with animated text

///children: list of bottom navigation bar items which consists of text and icon
///text: the title of the item
///icon: widget(image or icon) of the item
///onBarTap: function performed when a particular child item is pressed
///animatedTextDuration: duration of animated text (default value: Duration(milliseconds: 250))
///animatedTextCurve: curve of animated text (default value: Curves.easeInOut)
///textStyle: styling of animated text
///margin: margin of animated bottom navigation bar (default value: EdgeInsets.zero)
///borderRadius: border radius of animated bottom navigation bar (default value: BorderRadius.zero)
class AnimatedTextBottomBar extends StatefulWidget {
  final List<BottomBarItem> children;
  final Function onBarTap;
  final Duration animatedTextDuration;
  final Curve animatedTextCurve;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;

  AnimatedTextBottomBar({
    required this.children,
    required this.onBarTap,
    this.animatedTextDuration = const Duration(milliseconds: 250),
    this.animatedTextCurve = Curves.easeInOut,
    this.textStyle,
    this.margin = EdgeInsets.zero,
    this.borderRadius = BorderRadius.zero,
  });

  @override
  _AnimatedTextBottomBarState createState() => _AnimatedTextBottomBarState();
}

class _AnimatedTextBottomBarState extends State<AnimatedTextBottomBar>
    with TickerProviderStateMixin {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10.0,
      borderRadius: widget.borderRadius!,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        margin: widget.margin!,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _buildBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = [];
    for (int i = 0; i < widget.children.length; i++) {
      BottomBarItem item = widget.children[i];
      bool isSelected = selectedBarIndex == i;
      _barItems.add(InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            selectedBarIndex = i;
            widget.onBarTap(selectedBarIndex);
          });
        },
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          duration: widget.animatedTextDuration,
          decoration: BoxDecoration(
              color: isSelected
                  ? Theme.of(context).primaryColor.withOpacity(0.075)
                  : Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Row(
            children: <Widget?>[
              ImageIcon(
                AssetImage(item.image),
                color: isSelected
                    ? item.activeColor ?? Theme.of(context).primaryColor
                    : item.inactiveColor ?? Colors.black,
              ),
              SizedBox(width: 10.0),
              AnimatedSize(
                duration: widget.animatedTextDuration,
                curve: widget.animatedTextCurve,
                vsync: this,
                child: Text(
                  isSelected ? item.text : "",
                  style: widget.textStyle ??
                      Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ] as List<Widget>,
          ),
        ),
      ));
    }
    return _barItems;
  }
}

///BottomBarItem is used as the child widget of animated text bottom bar given
///to it's children property

///text: the text to be animated (it will be shown only when the item is selected
///icon: icon shown when the item is selected or unselected
///activeColor: color of image(icon) when the item is selected
///inactiveColor: color of image(icon) when the item is not selected
class BottomBarItem {
  final String text;
  final String image;
  final Color? activeColor;
  final Color? inactiveColor;

  BottomBarItem({
    required this.text,
    required this.image,
    this.activeColor,
    this.inactiveColor,
  });
}
