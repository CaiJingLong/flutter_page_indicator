import 'package:flutter/material.dart';

enum IndicatorShape { circle, roundRectangle }

class PageIndicator extends StatefulWidget {
  final Color color;

  final Color selectedColor;

  final double size;

  final int length;

  final PageController controller;

  final double indicatorSpace;

  final IndicatorShape indicatorShape;

  const PageIndicator(
      {Key key,
      this.color = Colors.white,
      this.selectedColor = Colors.grey,
      this.size = 10.0,
      @required this.controller,
      @required this.length,
      this.indicatorSpace = 5.0,
      this.indicatorShape = IndicatorShape.circle})
      : super(key: key);

  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  PageController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CustomPainter indicatorPainter;
    switch (widget.indicatorShape) {
      case IndicatorShape.roundRectangle:
        indicatorPainter = RRectPainter(
            color: widget.color,
            selectedColor: widget.selectedColor,
            count: widget.length,
            page: widget.controller.page ?? controller.initialPage.toDouble(),
            padding: widget.indicatorSpace,
            width: widget.size);
        break;
      case IndicatorShape.circle:
      default:
        indicatorPainter = CirclePainter(
            color: widget.color,
            selectedColor: widget.selectedColor,
            count: widget.length,
            page: widget.controller.page ?? controller.initialPage.toDouble(),
            padding: widget.indicatorSpace,
            radius: widget.size / 2);
        break;
    }

    return IgnorePointer(
        child: CustomPaint(
      child: Container(
        height: double.infinity,
      ),
      painter: indicatorPainter,
    ));
  }
}

class RRectPainter extends CustomPainter {
  double page;
  int count;
  Color color;
  Color selectedColor;
  double width;
  double padding;
  Paint _circlePaint;
  Paint _selectedPaint;
  RRectPainter(
      {this.page = 0.0,
      this.count = 0,
      this.color = Colors.white,
      this.selectedColor = Colors.grey,
      this.width = 12.0,
      this.padding = 5.0}) {
    _circlePaint = Paint();
    _circlePaint.color = color;

    _selectedPaint = Paint();
    _selectedPaint.color = selectedColor;

    this.page ??= 0.0;
    this.count ??= 0;
    this.color ??= Colors.white;
    this.selectedColor ??= Colors.grey;
    this.width ??= 6.0;
    this.padding ??= 5.0;
  }
double get totalWidth => count * width + padding * (count - 1);

  @override
  void paint(Canvas canvas, Size size) {
    var height = width / 3;
    var centerWidth = size.width / 2;
    var startX = centerWidth - totalWidth / 2;
    for (var i = 0; i < count ?? 0; i++) {
      var x = startX + i * (width + padding);
      var rect = Rect.fromLTWH(x, 0, width, height);
      var rrect = RRect.fromRectAndRadius(rect, Radius.circular(height));
      canvas.drawRRect(rrect, _circlePaint);
    }

    var selectedX = startX + page * (width + padding);
    var rect = Rect.fromLTWH(selectedX, 0, width, height);
    var rrect = RRect.fromRectAndRadius(rect, Radius.circular(height));
    canvas.drawRRect(rrect, _selectedPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CirclePainter extends CustomPainter {
  double page;
  int count;
  Color color;
  Color selectedColor;
  double radius;
  double padding;
  Paint _circlePaint;
  Paint _selectedPaint;
  CirclePainter(
      {this.page = 0.0,
      this.count = 0,
      this.color = Colors.white,
      this.selectedColor = Colors.grey,
      this.radius = 12.0,
      this.padding = 5.0}) {
    _circlePaint = Paint();
    _circlePaint.color = color;

    _selectedPaint = Paint();
    _selectedPaint.color = selectedColor;

    this.page ??= 0.0;
    this.count ??= 0;
    this.color ??= Colors.white;
    this.selectedColor ??= Colors.grey;
    this.radius ??= 12.0;
    this.padding ??= 5.0;
  }

  double get totalWidth => count * radius * 2 + padding * (count - 1);

  @override
  void paint(Canvas canvas, Size size) {
    var centerWidth = size.width / 2;
    var startX = centerWidth - totalWidth / 2;
    for (var i = 0; i < count ?? 0; i++) {
      var x = startX + i * (radius * 2 + padding);
      canvas.drawCircle(Offset(x, radius), radius, _circlePaint);
    }

    var selectedX = startX + page * (radius * 2 + padding);
    canvas.drawCircle(Offset(selectedX, radius), radius, _selectedPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
