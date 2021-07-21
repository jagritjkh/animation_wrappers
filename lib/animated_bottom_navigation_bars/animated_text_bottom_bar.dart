import 'package:flutter/material.dart';

/// [AnimatedTextBottomBar] animated bottom navigation bar with animated text

/// [children] : list of bottom navigation bar items which consists of text and (icon or image)
/// [text] : the title of the item
/// [icon] : icon of the item
/// [image] : image of the item
/// [onBarTap] : function performed when a particular child item is pressed
/// [animatedTextDuration] : duration of animated text (default value: Duration(milliseconds: 250))
/// [animatedTextCurve] : curve of animated text (default value: [Curves.easeInOut])
/// [textStyle] : styling of animated text
/// [margin] : margin of animated bottom navigation bar (default value: [EdgeInsets.zero])
/// [padding] : padding for children of animated bottom navigation bar (default value: EdgeInsets.symmetric(vertical: 8.0))
/// [borderRadius] : border radius of animated bottom navigation bar (default value: [BorderRadius.zero])
/// [selectedItemColor] : color of image or icon when the item is selected
/// [unselectedItemColor] : color of image or icon when the item is not selected
/// [selectedItemBorderRadius] : borderRadius of item when the item is selected (default value = BorderRadius.all(Radius.circular(30)))
class AnimatedTextBottomBar extends StatefulWidget {
  final List<BottomBarItem> children;
  final ValueChanged<int>? onBarTap;
  final Duration animatedTextDuration;
  final Curve animatedTextCurve;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final double elevation;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final BorderRadius selectedItemBorderRadius;

  AnimatedTextBottomBar({
    Key? key,
    required this.children,
    required this.onBarTap,
    this.animatedTextDuration = const Duration(milliseconds: 250),
    this.animatedTextCurve = Curves.easeInOut,
    this.textStyle,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
    this.borderRadius = BorderRadius.zero,
    this.elevation = 10.0,
    this.backgroundColor,
    this.shadowColor,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedItemBorderRadius = const BorderRadius.all(Radius.circular(30)),
  }) : super(key: key);

  @override
  _AnimatedTextBottomBarState createState() => _AnimatedTextBottomBarState();
}

/// [_selectedBarIndex] : index of current selected bottom bar item (default is set to 0).
class _AnimatedTextBottomBarState extends State<AnimatedTextBottomBar>
    with TickerProviderStateMixin {
  int _selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: Material(
        elevation: widget.elevation,
        borderRadius: widget.borderRadius,
        color:
            widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        shadowColor: widget.shadowColor,
        child: Padding(
          padding: widget.padding,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buildBarItems(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBarItems() {
    List<Widget> _barItems = [];
    for (int i = 0; i < widget.children.length; i++) {
      BottomBarItem item = widget.children[i];
      bool isSelected = _selectedBarIndex == i;
      _barItems.add(
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              _selectedBarIndex = i;
              widget.onBarTap?.call(i);
            });
          },
          child: AnimatedContainer(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            duration: widget.animatedTextDuration,
            decoration: BoxDecoration(
              color: isSelected
                  ? (widget.selectedItemColor ?? Theme.of(context).primaryColor)
                      .withOpacity(0.075)
                  : Colors.transparent,
              borderRadius: widget.selectedItemBorderRadius,
            ),
            child: Row(
              children: [
                if (item.image != null)
                  ImageIcon(
                    AssetImage(item.image!),
                    color: isSelected
                        ? widget.selectedItemColor ??
                            Theme.of(context).primaryColor
                        : widget.unselectedItemColor ??
                            Theme.of(context).disabledColor,
                  ),
                if (item.iconData != null)
                  Icon(
                    item.iconData!,
                    color: isSelected
                        ? widget.selectedItemColor ??
                            Theme.of(context).primaryColor
                        : widget.unselectedItemColor ??
                            Theme.of(context).disabledColor,
                  ),
                if (item.text != null) SizedBox(width: 10.0),
                if (item.text != null)
                  AnimatedSize(
                    duration: widget.animatedTextDuration,
                    curve: widget.animatedTextCurve,
                    vsync: this,
                    child: Text(
                      isSelected ? item.text! : "",
                      style: widget.textStyle ??
                          Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    }
    return _barItems;
  }
}

/// [BottomBarItem] is used as the child widget of animated text bottom bar given to it's children property

/// [text] : the text to be animated (it will be shown only when the item is selected
/// [image] : image shown when the item is selected or unselected
/// [iconData] : icon shown when the item is selected or unselected
/// only [image] or [iconData] can be given, not both
/// assert when neither [image] nor [icon] is given
class BottomBarItem {
  final String? text;
  final String? image;
  final IconData? iconData;

  BottomBarItem({
    this.text,
    this.image,
    this.iconData,
  }) : assert(image != null || iconData != null);
}
