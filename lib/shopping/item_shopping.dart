// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:ev_driver/shopping/item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_wallet/flutter_google_wallet_plugin.dart';
import 'package:flutter_google_wallet/widget/add_to_google_wallet_button.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../player_progress/player_progress.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import 'items.dart';

class ItemShoppingScreen extends StatefulWidget {
  final flutterGoogleWalletPlugin = FlutterGoogleWalletPlugin();
  ItemShoppingScreen({super.key});

  static const _gap = SizedBox(height: 20);

  @override
  State<ItemShoppingScreen> createState() => _ItemShoppingScreenState();
}

class _ItemShoppingScreenState extends State<ItemShoppingScreen> {
  late Future<bool> _isWalletAvailable;

  @override
  void initState() {
    super.initState();
    _isWalletAvailable = Future(() async {
      // return true;
      await widget.flutterGoogleWalletPlugin.initWalletClient();
      return widget.flutterGoogleWalletPlugin.getWalletApiAvailabilityStatus();
    });
  }

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
                    Icons.energy_savings_leaf,
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
          FutureBuilder<bool>(
            future: _isWalletAvailable,
            builder: (BuildContext context, AsyncSnapshot<bool> available) {
              if (available.data == true) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: AddToGoogleWalletButton(
                      locale: const Locale('fr', 'FR'),
                      onPress: () {
                        widget.flutterGoogleWalletPlugin.savePasses(
                            jsonPass: exampleJsonPass,
                            addToGoogleWalletRequestCode: 2);
                      },
                    ),
                  ),
                );
              } else {
                return const SizedBox.shrink();
              }
            },
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
                            Row(
                              children: [
                                Text(
                                  '${type.name} - ',
                                  style: TextStyle(
                                    fontFamily: 'Electric',
                                    fontSize: 20,
                                    height: 1,
                                  ),
                                ),
                                Text(
                                  '${type.cost}',
                                  style: TextStyle(
                                    fontFamily: 'Electric',
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

const exampleJsonPass = '''
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
        "id": "3388000000022324825.codelab_object",
        "classId": "3388000000022324825.codelab_class",
        "genericType": "GENERIC_TYPE_UNSPECIFIED",
        "hexBackgroundColor": "#4285f4",
        "logo": {
          "sourceUri": {
            "uri": "https://storage.googleapis.com/wallet-lab-tools-codelab-artifacts-public/pass_google_logo.jpg"
          }
        },
        "cardTitle": {
          "defaultValue": {
            "language": "en-US",
            "value": "Google I/O '22"
          }
        },
        "subheader": {
          "defaultValue": {
            "language": "en-US",
            "value": "Attendee"
          }
        },
        "header": {
          "defaultValue": {
            "language": "en-US",
            "value": "Alex McJacobs"
          }
        },
        "barcode": {
          "type": "QR_CODE",
          "value": "3388000000022324825.codelab_object"
        },
        "heroImage": {
          "sourceUri": {
            "uri": "https://storage.googleapis.com/wallet-lab-tools-codelab-artifacts-public/google-io-hero-demo-only.jpg"
          }
        },
        "textModulesData": [
          {
            "header": "POINTS",
            "body": "1234",
            "id": "points"
          },
          {
            "header": "CONTACTS",
            "body": "20",
            "id": "contacts"
          }
        ]
      }
    ]
  },
  "iat": 1709926827
}
''';
