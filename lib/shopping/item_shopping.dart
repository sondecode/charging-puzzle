// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:add_to_google_wallet/widgets/add_to_google_wallet_button.dart';
import 'package:ev_driver/shopping/item_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../player_progress/player_progress.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import 'items.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ItemShoppingScreen extends StatelessWidget {
  // final flutterGoogleWalletPlugin = FlutterGoogleWalletPlugin();
  const ItemShoppingScreen({super.key});

  static const _gap = SizedBox(height: 20);
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final playerProgress = context.watch<PlayerProgress>();

    return Scaffold(
      backgroundColor: palette.backgroundLevelSelection,
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.storeName,
                style: TextStyle(
                    fontFamily: 'Square',
                    fontStyle: FontStyle.italic,
                    fontSize: 30),
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
                    Icons.energy_savings_leaf,
                  ),
                  Text(
                    playerProgress.money.toString(),
                    style: TextStyle(
                      fontFamily: 'Square',
                      fontStyle: FontStyle.italic,
                      fontSize: 30,
                      height: 1,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(height: 8.0),
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
                        fontFamily: 'Square',
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        height: 1,
                      ),
                    ),
                    title: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${type.name} - ',
                                  style: TextStyle(
                                    fontFamily: 'Square',
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20,
                                    height: 1,
                                  ),
                                ),
                                Text(
                                  '${type.cost}',
                                  style: TextStyle(
                                    fontFamily: 'Square',
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20,
                                    height: 1,
                                  ),
                                ),
                                Icon(
                                  Icons.energy_savings_leaf,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            playerProgress.isBought(type.number)
                                ? playerProgress.curVehicle == type.number
                                    ? MyButton(
                                        child: Text(
                                        AppLocalizations.of(context)!.inUse,
                                        style: TextStyle(
                                          fontFamily: 'Square',
                                          fontStyle: FontStyle.italic,
                                          fontSize: 20,
                                          height: 1,
                                        ),
                                      ))
                                    : MyButton(
                                        child: Text(
                                          AppLocalizations.of(context)!.use,
                                          style: TextStyle(
                                            fontFamily: 'Square',
                                            fontStyle: FontStyle.italic,
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
                                      AppLocalizations.of(context)!.buy,
                                      style: TextStyle(
                                        fontFamily: 'Square',
                                        fontStyle: FontStyle.italic,
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
                            'assets/images/sprites/vehicles/${type.name}.png'),
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
            child: Text(
              AppLocalizations.of(context)!.back,
              style: TextStyle(
                color: Colors.blueGrey,
                fontFamily: 'Square',
                fontStyle: FontStyle.italic,
                fontSize: 25,
                height: 1,
              ),
            ),
          ),
          _gap,
        ]),
      ),
    );
  }
}
