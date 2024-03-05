import 'dart:math';

import 'package:basic/transport/customer.dart';
import 'package:basic/transport/address.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RadarDialog extends StatefulWidget {
  @override
  _RadarDialogState createState() => _RadarDialogState();
}

class _RadarDialogState extends State<RadarDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Customer? _selectedCustomer;
  List<Address> _selectedAddress = [];
  int _distance = 1;

  bool _completed = false; // Flag to track completion

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Reduced duration to 1 second
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _completed = true; // Set completion flag to true
          });
          Future.delayed(Duration(seconds: 1), () {
            setState(() {
              _selectedCustomer =
                  customerList[Random().nextInt(customerList.length)];
              _selectedAddress = List.from(gameAddress);
              _selectedAddress.shuffle();
              _selectedAddress = _selectedAddress.sublist(0, 2);
              _distance = Random().nextInt(100) + 1;
            });
          });
        }
      });

    _controller.forward(); // Start the animation
  }

  void _skip() {
    setState(() {
      _selectedCustomer = null;
      _completed = false;
      _controller.reset();
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: _selectedCustomer == null
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    !_completed
                        ? AnimatedBuilder(
                            animation: _animation,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: _animation.value * 2 * 3.14,
                                child: Icon(
                                  Icons.radar,
                                  size: 100.0,
                                  color: Colors.blue,
                                ),
                              );
                            },
                          )
                        : Icon(
                            Icons.done_outline_rounded,
                            size: 100.0,
                            color: Colors.greenAccent,
                          ),
                    SizedBox(height: 20.0),
                    Text(
                      _completed
                          ? 'Complete'
                          : 'Searching for signal...', // Update text based on completion flag
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              : Container(
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
                                  _selectedCustomer!.name,
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Pickup point: ${_selectedAddress.first.name}",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Drop-off point: ${_selectedAddress.last.name}",
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Distance: ${_distance} km",
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
                              _skip();
                            },
                            child: Text('Skip'),
                          ),
                          SizedBox(width: 10.0),
                          TextButton(
                            onPressed: () {
                              final booking = Booking(
                                  customer: _selectedCustomer!,
                                  from: _selectedAddress.first.number,
                                  end: _selectedAddress.last.number,
                                  distance: _distance);

                              Navigator.of(context).pop();
                              GoRouter.of(context)
                                  .push("/transport", extra: booking);
                            },
                            child: Text('Accept'),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
    );
  }
}

class Booking {
  final Customer customer;

  final int from;

  final int end;

  final int distance;

  const Booking({
    required this.customer,
    required this.from,
    required this.end,
    required this.distance,
  });
}
