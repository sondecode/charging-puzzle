import 'package:ev_driver/common/function.dart';
import 'package:ev_driver/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PuzzleTile extends StatefulWidget {
  final String letter; // Tile type (e.g., "C_2", "L_1", "S_1")
  // final bool isFixed; // Whether the tile is fixed (like the solar panel)
  final Function onTap;
  final bool hide;
  final bool startBg;
  final bool isBg;
  final double width;
  final int angle;
  const PuzzleTile(
      {super.key,
      required this.letter,
      required this.onTap,
      required this.hide,
      this.isBg = false,
      required this.width,
      required this.angle,
      required this.startBg});

  @override
  State<PuzzleTile> createState() => _PuzzleTileState();
}

class _PuzzleTileState extends State<PuzzleTile> {
  double rotationAngle = 0.0;
  String letter = "I";
  Widget sprite = Container();
  bool _isEnd = false;
  bool _isStart = false;

  @override
  void initState() {
    super.initState();
    rotationAngle = widget.angle * 90;
    letter = widget.letter;

    if (isEnd(letter)) {
      _isEnd = true;
    }

    if (isStart(letter)) {
      _isStart = true;
    }

    //To-do
    if (letter == "Y") {
      letter = "customer";
    }

    sprite = Image.asset('assets/images/sprites/${letter}_sprite.png');
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return GestureDetector(
        onTap: _isEnd
            ? null
            : () {
                setState(() {
                  rotationAngle += 90.0;
                  if (rotationAngle == 360) rotationAngle = 0;
                });
                widget.onTap(); // Call the onTap callback function
              },
        child: widget.isBg
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(color: Colors.grey),
                ),
              )
            : Stack(
                children: [
                  Transform.rotate(
                    angle: rotationAngle * (3.14159265359 / 180),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: widget.hide
                          ? Container()
                          : Stack(
                              children: [
                                _isStart
                                    ? SizedBox(
                                        width: widget.width,
                                        height: widget.width,
                                        child: FittedBox(
                                            fit: BoxFit.fill,
                                            child: Image.asset(
                                                'assets/images/sprites/start_bg.png')))
                                    : _isEnd
                                        ? SizedBox(
                                            width: widget.width,
                                            height: widget.width,
                                            child: FittedBox(
                                                fit: BoxFit.fill,
                                                child: Image.asset(
                                                    'assets/images/sprites/end_bg.png')))
                                        : Container(),
                                widget.startBg || _isEnd
                                    ? Container()
                                    : SizedBox(
                                        width: widget.width,
                                        height: widget.width,
                                        child: FittedBox(
                                            fit: BoxFit.fitHeight,
                                            child: sprite)),
                              ],
                            ),
                      // Center(child: Text(widget.type)),
                    ),
                  ),
                  _isEnd
                      ? SizedBox(
                          width: widget.width,
                          height: widget.width,
                          child:
                              FittedBox(fit: BoxFit.fitHeight, child: sprite))
                      : Container()
                ],
              ));
  }
}
