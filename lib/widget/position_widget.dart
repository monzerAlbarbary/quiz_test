
import 'package:flutter/material.dart';

class PositionWidget extends StatelessWidget {
  PositionWidget({
    super.key,
    required this.top,
    required this.left,
    required this.image,
  });
  final double top;
  final double left;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: Image.asset(image),
    );
  }
}
