import 'package:flutter/material.dart';

class PuzzleTile extends StatefulWidget {
  final String type; // Tile type (e.g., "C_2", "L_1", "S_1")
  // final bool isFixed; // Whether the tile is fixed (like the solar panel)
  final Function onTap;
  final bool hide;
  const PuzzleTile(
      {super.key, required this.type, required this.onTap, required this.hide});

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

    if (letter == "S") {
      disable = true;
    }

    if (letter == "C") {
      final image = Image.asset('assets/images/sprites/${letter}_sprite.png');
      final bg = Image.asset('assets/images/sprites/start_bg.png');
      sprite = Stack(
        children: [bg, image],
      );
    } else {
      sprite = Image.asset('assets/images/sprites/${letter}_sprite.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: disable
            ? null
            : () {
                print(rotationAngle);
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
            child: widget.hide ? Container() : sprite,
            // Center(child: Text(widget.type)),
          ),
        ));
  }
}
