import 'package:flutter/material.dart';

enum IndicatorShape { circle, oval }

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
    return IgnorePointer(
      child: CustomPaint(
        child: Container(
          height: double.infinity,
        ),
        painter: CirclePainter(
            color: widget.color,
            selectetColor: widget.selectedColor,
            count: widget.length,
            page: widget.controller.page ?? controller.initialPage.toDouble(),
            padding: widget.indicatorSpace,
            radius: widget.size / 2,
            shape: widget.indicatorShape
            ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  double page;
  int count;
  Color color;
  Color selectetColor;
  double radius;
  double padding;
  IndicatorShape shape;
  Paint _circlePaint;
  Paint _selectedPaint;
  CirclePainter(
      {this.page = 0.0,
      this.count = 0,
      this.color = Colors.white,
      this.selectetColor = Colors.grey,
      this.radius = 12.0,
      this.padding = 5.0,
      this.shape = IndicatorShape.oval}) {
    _circlePaint = Paint();
    _circlePaint.color = color;

    _selectedPaint = Paint();
    _selectedPaint.color = selectetColor;

    this.page ??= 0.0;
    this.count ??= 0;
    this.color ??= Colors.white;
    this.selectetColor ??= Colors.grey;
    this.radius ??= 12.0;
    this.padding ??= 5.0;
  }

  double get totalWidth => count * radius * 2 + padding * (count - 1);

  @override
  void paint(Canvas canvas, Size size) {
    switch (shape) {
      case IndicatorShape.oval:
        paintOval(canvas, size);
        break;
      case IndicatorShape.circle:
      default:
        paintCircle(canvas, size);
        break;
    }
  }

  void paintCircle(Canvas canvas, Size size) {
    var centerWidth = size.width / 2;
    var startX = centerWidth - totalWidth / 2;
    for (var i = 0; i < count ?? 0; i++) {
      var x = startX + i * (radius * 2 + padding);
      canvas.drawCircle(Offset(x, radius), radius, _circlePaint);
    }

    var selectedX = startX + page * (radius * 2 + padding);
    canvas.drawCircle(Offset(selectedX, radius), radius, _selectedPaint);
  }

  void paintOval(Canvas canvas, Size size) {
    var height = radius / 3;
    var centerWidth = size.width / 2;
    var startX = centerWidth - totalWidth / 2;
    for (var i = 0; i < count ?? 0; i++) {
      var x = startX + i * (radius * 2 + padding);
      var rect = Rect.fromLTWH(x, 0, radius, height);
      var rrect = RRect.fromRectAndRadius(rect, Radius.circular(height));
      canvas.drawRRect(rrect, _circlePaint);
    }

    var selectedX = startX + page * (radius * 2 + padding);
    var rect = Rect.fromLTWH(selectedX, 0, radius, height);
    var rrect = RRect.fromRectAndRadius(rect, Radius.circular(height));
    canvas.drawRRect(rrect, _selectedPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
