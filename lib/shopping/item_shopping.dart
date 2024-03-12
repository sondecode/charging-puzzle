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
                        playerProgress.isBought(type.number)
                            ? IgnorePointer(
                                ignoring: kIsWeb,
                                child: Column(
                                  children: [
                                    AddToGoogleWalletButton(
                                      pass: collectionPass(
                                          type, playerProgress.userId),
                                      onError: (Object error) =>
                                          _onError(context, error),
                                      onSuccess: () => _onSuccess(context),
                                      onCanceled: () => _onCanceled(context),
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.available,
                                      style: TextStyle(fontSize: 10),
                                    )
                                  ],
                                ),
                              )
                            : Container(),
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

  void _onError(BuildContext context, Object error) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(error.toString()),
        ),
      );

  void _onSuccess(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content:
              Text('Pass has been successfully added to the Google Wallet.'),
        ),
      );

  void _onCanceled(BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.yellow,
          content: Text('Adding a pass has been canceled.'),
        ),
      );
}

String collectionPass(VehicleType type, String userId) => '''
{
  "iss": "player@evdriver-416618.iam.gserviceaccount.com",
  "aud": "google",
  "origins": [
    "http://localhost:3000"
  ],
  "typ": "savetowallet",
  "payload": {
    "genericObjects": [
      {
        "id": "3388000000022324825.$userId.${type.name.toLowerCase()}",
        "classId": "3388000000022324825.codelab_class",
        "genericType": "GENERIC_TYPE_UNSPECIFIED",
        "hexBackgroundColor": "#4285f4",
        "logo": {
          "sourceUri": {
            "uri": "https://lh3.googleusercontent.com/Ic6alTIG3C_sr6Tqi0E3RJkpubHGXE8smicwdHTleCSsvcoqj6wz8iRMi2ZYj5KRGr66XXB2o87czoI6ATB226q6r2PC4ss"
          }
        },
        "cardTitle": {
          "defaultValue": {
            "language": "en-US",
            "value": "EVDriver Collection"
          }
        },
        "subheader": {
          "defaultValue": {
            "language": "en-US",
            "value": "Electric Vehicle"
          }
        },
        "header": {
          "defaultValue": {
            "language": "en-US",
            "value": "${type.name.toUpperCase()}"
          }
        },
        "heroImage": {
          "sourceUri": {
            "uri": "${type.imgLink}"
          }
        },
        "textModulesData": [
          {
            "header": "CO2 Cef",
            "body": "100",
            "id": "points"
          }
        ]
      }
    ]
  },
  "iat": 1709975018
}
''';
