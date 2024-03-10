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

class ItemShoppingScreen extends StatelessWidget {
  // final flutterGoogleWalletPlugin = FlutterGoogleWalletPlugin();
  ItemShoppingScreen({super.key});

  static const _gap = SizedBox(height: 20);

  late Future<bool> _isWalletAvailable;

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
                                        'Used',
                                        style: TextStyle(
                                          fontFamily: 'Square',
                                          fontStyle: FontStyle.italic,
                                          fontSize: 20,
                                          height: 1,
                                        ),
                                      ))
                                    : MyButton(
                                        child: Text(
                                          'Use',
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
                                      'Buy',
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
                                      pass: collectionPass(type),
                                      onError: (Object error) =>
                                          _onError(context, error),
                                      onSuccess: () => _onSuccess(context),
                                      onCanceled: () => _onCanceled(context),
                                    ),
                                    Text(
                                      'Available in Android',
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
            child: const Text(
              'Back',
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

String collectionPass(VehicleType type) => '''
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
        "id": "3388000000022324825.${type.name.toLowerCase()}",
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
            "value": "Square Vehicle"
          }
        },
        "header": {
          "defaultValue": {
            "language": "en-US",
            "value": "${type.name.toUpperCase()}"
          }
        },
        "barcode": {
          "type": "QR_CODE",
          "value": "3388000000022324825.codelab_object1"
        },
        "heroImage": {
          "sourceUri": {
            "uri": "https://shop.vinfastauto.com/on/demandware.static/-/Sites-app_vinfast_vn-Library/default/dwd5cf25f3/reserves/VF6/exterior-vf6-1.jpg"
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
