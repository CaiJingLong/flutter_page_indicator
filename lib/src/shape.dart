abstract class IndicatorShape {
  const IndicatorShape();

  static const circle = const CircleShape();

  static const roundRectangle = const RoundRectangleShape();
}

class CircleShape extends IndicatorShape {
  const CircleShape();
}

class RoundRectangleShape extends IndicatorShape {
  final double ratio;

  const RoundRectangleShape({this.ratio = 3 / 1});
}
