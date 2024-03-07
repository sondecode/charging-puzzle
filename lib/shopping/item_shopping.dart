// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:ev_driver/shopping/item_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../player_progress/player_progress.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import 'items.dart';

class ItemShoppingScreen extends StatefulWidget {
  const ItemShoppingScreen({super.key});

  static const _gap = SizedBox(height: 20);

  @override
  State<ItemShoppingScreen> createState() => _ItemShoppingScreenState();
}

class _ItemShoppingScreenState extends State<ItemShoppingScreen> {
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final playerProgress = context.watch<PlayerProgress>();

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: SafeArea(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                'Electric Vehicle Store',
                style: TextStyle(fontFamily: 'Electric', fontSize: 30),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    size: 40,
                    Icons.monetization_on,
                  ),
                  Text(
                    playerProgress.money.toString(),
                    style: TextStyle(
                      fontFamily: 'Electric',
                      fontSize: 30,
                      height: 1,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          Expanded(
            child: ListView(
              children: [
                for (final type in vehicleType)
                  ListTile(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ItemDetails(
                            details: type,
                          );
                        },
                      );
                    },
                    leading: Text(
                      type.number.toString(),
                      style: TextStyle(
                        fontFamily: 'Electric',
                        fontSize: 20,
                        height: 1,
                      ),
                    ),
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${type.name} - \$${type.cost}',
                              style: TextStyle(
                                fontFamily: 'Electric',
                                fontSize: 20,
                                height: 1,
                              ),
                            ),
                            playerProgress.isBought(type.number)
                                ? playerProgress.curVehicle == type.number
                                    ? MyButton(
                                        child: Text(
                                        'Used',
                                        style: TextStyle(
                                          fontFamily: 'Electric',
                                          fontSize: 20,
                                          height: 1,
                                        ),
                                      ))
                                    : MyButton(
                                        child: Text(
                                          'Use',
                                          style: TextStyle(
                                            fontFamily: 'Electric',
                                            fontSize: 20,
                                            height: 1,
                                          ),
                                        ),
                                        onPressed: () {
                                          playerProgress
                                              .useVehicle(type.number);
                                        },
                                      )
                                : MyButton(
                                    child: Text(
                                      'Buy',
                                      style: TextStyle(
                                        fontFamily: 'Electric',
                                        fontSize: 20,
                                        height: 1,
                                      ),
                                    ),
                                    onPressed: () {
                                      playerProgress.buyVehicle(type.number);
                                    },
                                  )
                          ],
                        ),
                        Image.asset(
                            'assets/images/sprites/vehicles/${type.name}.png')
                      ],
                    ),
                  )
              ],
            ),
          ),
          MyButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            child: const Text(
              'Back',
              style: TextStyle(
                color: Colors.blueGrey,
                fontFamily: 'Electric',
                fontSize: 25,
                height: 1,
              ),
            ),
          ),
          ItemShoppingScreen._gap,
        ]),
      ),
    );
  }
}
