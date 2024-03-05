import 'package:basic/common/function.dart';
import 'package:basic/style/palette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PuzzleTile extends StatefulWidget {
  final String type; // Tile type (e.g., "C_2", "L_1", "S_1")
  // final bool isFixed; // Whether the tile is fixed (like the solar panel)
  final Function onTap;
  final bool hide;
  final bool startBg;
  final double width;
  const PuzzleTile(
      {super.key,
      required this.type,
      required this.onTap,
      required this.hide,
      required this.width,
      required this.startBg});

  @override
  State<PuzzleTile> createState() => _PuzzleTileState();
}

class _PuzzleTileState extends State<PuzzleTile> {
  double rotationAngle = 0.0;
  String letter = "I";
  Widget sprite = Container();
  bool disable = false;

  @override
  void initState() {
    super.initState();
    final data = widget.type.split('_');
    rotationAngle = int.parse(data[1]) * 90;
    letter = data.first;

    if (isEnd(letter)) {
      disable = true;
    }

    // if (letter == "C") {
    //   final image = Image.asset('assets/images/sprites/${letter}_sprite.png');
    //   final bg = Image.asset('assets/images/sprites/start_bg.png');
    //   if (widget.startBg) {
    //     sprite = Stack(
    //       children: [bg],
    //     );
    //   } else {
    //     sprite = Stack(
    //       children: [bg, image],
    //     );
    //   }
    // } else {

    // }

    //To-do
    if (letter == "X") {
      letter = "C";
    }

    if (letter == "Y") {
      letter = "S";
    }

    sprite = Image.asset('assets/images/sprites/${letter}_sprite.png');
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    return GestureDetector(
        onTap: disable
            ? null
            : () {
                setState(() {
                  rotationAngle += 90.0;
                  if (rotationAngle == 360) rotationAngle = 0;
                });
                widget.onTap(); // Call the onTap callback function
              },
        child: Transform.rotate(
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
                      isStart(letter)
                          ? Container(
                              width: widget.width,
                              height: widget.width,
                              child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Image.asset(
                                      'assets/images/sprites/start_bg.png')))
                          : Container(),
                      widget.startBg
                          ? Container()
                          : SizedBox(
                              width: widget.width,
                              height: widget.width,
                              child:
                                  FittedBox(fit: BoxFit.fill, child: sprite)),
                    ],
                  ),
            // Center(child: Text(widget.type)),
          ),
        ));
  }
}
