import 'package:basic/shopping/items.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final VehicleType details;
  const ItemDetails({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                // CircleAvatar(
                //   radius: 40,
                //   backgroundImage: AssetImage("ass"),
                // ),
                Icon(size: 40, Icons.woman_sharp),
                SizedBox(width: 20.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        details.name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Pickup point: ${details.bonus}",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Drop-off point: ${details.maxEnergy}",
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Distance: ${details.speed} km",
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // _skip();
                  },
                  child: Text('Skip'),
                ),
                SizedBox(width: 10.0),
                TextButton(
                  onPressed: () {},
                  child: Text('Accept'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
