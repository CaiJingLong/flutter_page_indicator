import 'package:flutter/material.dart';

import 'indicator.dart';

enum IndicatorAlign {
  top,
  center,
  bottom,
}

class PageIndicatorContainer extends StatefulWidget {
  final PageView pageView;

  final int length;

  final EdgeInsets padding;

  final double size;

  final IndicatorAlign align;

  final Color indicatorColor;

  final Color indicatorSelectorColor;

  final double indicatorSpace;

  const PageIndicatorContainer({
    Key key,
    @required this.pageView,
    @required this.length,
    this.padding = const EdgeInsets.only(bottom: 15.0),
    this.size = 12.0,
    this.align = IndicatorAlign.bottom,
    this.indicatorColor = Colors.white,
    this.indicatorSelectorColor = Colors.grey,
    this.indicatorSpace = 8.0,
  }) : super(key: key);

  @override
  _PageContainerState createState() => _PageContainerState();
}

class _PageContainerState extends State<PageIndicatorContainer> {
  @override
  Widget build(BuildContext context) {
    var controller = pageView.controller;
    Widget indicator = Container(
      padding: widget.padding,
      child: PageIndicator(
        controller: controller,
        length: widget.length,
        color: widget.indicatorColor,
        selectedColor: widget.indicatorSelectorColor,
        size: widget.size,
        indicatorSpace: widget.indicatorSpace,
      ),
    );

    var align = widget.align;

    if (align == IndicatorAlign.bottom) {
      indicator = Positioned(
        left: 0.0,
        right: 0.0,
        bottom: widget.padding.bottom,
        height: widget.size,
        child: indicator,
      );
    } else if (align == IndicatorAlign.top) {
      indicator = Positioned(
        left: 0.0,
        right: 0.0,
        top: widget.padding.top,
        height: widget.size,
        child: indicator,
      );
    } else if (align == IndicatorAlign.center) {
      indicator = Center(
        child: Container(
          child: indicator,
          height: widget.size,
        ),
      );
    }

    return Stack(
      children: <Widget>[
        NotificationListener<ScrollNotification>(
          child: pageView,
          onNotification: _onScroll,
        ),
        indicator,
      ],
    );
  }

  PageView get pageView => widget.pageView;

  bool _onScroll(ScrollNotification notification) {
    setState(() {});
    return false;
  }
}
