import 'package:flutter/material.dart';

class CarWidget extends StatefulWidget {
  final double endX;
  final double endY;
  final int duration;
  final int degree;
  final Image image;
  final double width;

  const CarWidget({
    super.key,
    required this.width,
    required this.degree,
    required this.endX,
    required this.endY,
    required this.duration,
    required this.image,
  });

  @override
  _CarWidgetState createState() => _CarWidgetState();
}

class _CarWidgetState extends State<CarWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      left: widget.endX,
      top: widget.endY,
      duration: Duration(milliseconds: widget.duration),
      child: SizedBox(
        height: widget.width,
        width: widget.width,
        child: Transform.rotate(
            angle: widget.degree * 3.1415926535897932 / 180,
            child: widget.image),
      ),
    );
  }
}
