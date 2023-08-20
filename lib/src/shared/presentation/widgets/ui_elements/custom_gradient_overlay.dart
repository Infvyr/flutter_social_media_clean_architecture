import 'package:flutter/material.dart';

class CustomGradientOverlay extends StatelessWidget {
  const CustomGradientOverlay({
    super.key,
    this.stops = const [0.0, 0.2, 0.7, 1.0],
    this.colors = const [
      Colors.black,
      Colors.transparent,
      Colors.transparent,
      Colors.black,
    ],
    this.decorationBorderRadius = 0,
  });

  final List<double> stops;
  final List<Color> colors;
  final double decorationBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(decorationBorderRadius)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: stops,
            colors: colors,
          ),
        ),
      ),
    );
  }
}
