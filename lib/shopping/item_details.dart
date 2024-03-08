import 'package:ev_driver/shopping/items.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final VehicleType details;
  const ItemDetails({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      // CircleAvatar(
                      //   radius: 40,
                      //   backgroundImage: AssetImage("ass"),
                      // ),
                      Icon(size: 90, Icons.directions_car_filled_sharp),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              details.name,
                              style: TextStyle(
                                fontFamily: 'Electric',
                                fontWeight: FontWeight.bold,
                                fontSize: 29,
                                height: 1,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  "bonus: ${details.bonus}",
                                  style: TextStyle(
                                    fontFamily: 'Electric',
                                    fontSize: 20,
                                    height: 1,
                                  ),
                                ),
                                Icon(
                                  size: 20,
                                  Icons.energy_savings_leaf,
                                ),
                                Text(
                                  "/km",
                                  style: TextStyle(
                                    fontFamily: 'Electric',
                                    fontSize: 20,
                                    height: 1,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              "pin cell: ${details.maxEnergy}",
                              style: TextStyle(
                                fontFamily: 'Electric',
                                fontSize: 20,
                                height: 1,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "speed: ${details.speed} km/h",
                              style: TextStyle(
                                fontFamily: 'Electric',
                                fontSize: 20,
                                height: 1,
                              ),
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
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontFamily: 'Electric',
                            fontSize: 20,
                            height: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close),
              ),
            )
          ],
        ),
      ),
    );
  }
}
