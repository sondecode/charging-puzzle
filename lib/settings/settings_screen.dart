// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../player_progress/player_progress.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import 'custom_name_dialog.dart';
import 'settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const _gap = SizedBox(height: 20);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();
    final palette = context.watch<Palette>();

    return Scaffold(
        backgroundColor: palette.backgroundSettings,
        body: SafeArea(
          child: Column(
            children: [
              Column(
                children: [
                  _gap,
                  Text(
                    AppLocalizations.of(context)!.settings,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Square',
                      fontStyle: FontStyle.italic,
                      fontSize: 55,
                      height: 1,
                    ),
                  ),
                  _gap,
                  _NameChangeLine(
                    AppLocalizations.of(context)!.name,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: settings.soundsOn,
                    builder: (context, soundsOn, child) => _SettingsLine(
                      AppLocalizations.of(context)!.soundFX,
                      Icon(soundsOn ? Icons.graphic_eq : Icons.volume_off),
                      onSelected: () => settings.toggleSoundsOn(),
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: settings.musicOn,
                    builder: (context, musicOn, child) => _SettingsLine(
                      AppLocalizations.of(context)!.music,
                      Icon(musicOn ? Icons.music_note : Icons.music_off),
                      onSelected: () => settings.toggleMusicOn(),
                    ),
                  ),
                  _SettingsLine(
                    AppLocalizations.of(context)!.reset,
                    const Icon(Icons.delete),
                    onSelected: () {
                      context.read<PlayerProgress>().reset();

                      final messenger = ScaffoldMessenger.of(context);
                      messenger.showSnackBar(
                        const SnackBar(
                            content: Text('Player progress has been reset.')),
                      );
                    },
                  ),
                  _SettingsLine(
                    AppLocalizations.of(context)!.about,
                    const Icon(Icons.help),
                    onSelected: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('About App'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('App Name: EVDriver'),
                                Text('Version: 1.0.0'),
                                Text('Author: N.T.Son'),
                                Text('Copyright © 2024'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  // _LanguageChangeLine(AppLocalizations.of(context)!.language),
                  _gap,
                ],
              ),
              Spacer(),
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
            ],
          ),
        ));
  }
}

class _NameChangeLine extends StatelessWidget {
  final String title;

  const _NameChangeLine(this.title);

  @override
  Widget build(BuildContext context) {
    final settings = context.watch<SettingsController>();

    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: () => showCustomNameDialog(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: const TextStyle(
                  fontFamily: 'Square',
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                )),
            const Spacer(),
            ValueListenableBuilder(
              valueListenable: settings.playerName,
              builder: (context, name, child) => Text(
                '‘$name’',
                style: const TextStyle(
                  fontFamily: 'Square',
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsLine extends StatelessWidget {
  final String title;

  final Widget icon;

  final VoidCallback? onSelected;

  const _SettingsLine(this.title, this.icon, {this.onSelected});

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      highlightShape: BoxShape.rectangle,
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Square',
                  fontStyle: FontStyle.italic,
                  fontSize: 30,
                ),
              ),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
