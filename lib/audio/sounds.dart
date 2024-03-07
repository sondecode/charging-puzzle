// Copyright 2022, the Flutter project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

List<String> soundTypeToFilename(SfxType type) {
  switch (type) {
    case SfxType.buttonTap:
      return const [
        'tap.mp3',
      ];
    case SfxType.congrats:
      return const [
        'won.wav',
      ];
    case SfxType.rotate:
      return const [
        'rotate.mp3',
      ];
    case SfxType.carStart:
      return const [
        'start.mp3',
      ];
  }
}

/// Allows control over loudness of different SFX types.
double soundTypeToVolume(SfxType type) {
  switch (type) {
    case SfxType.buttonTap:
    case SfxType.congrats:
    case SfxType.rotate:
    case SfxType.carStart:
      return 1.0;
  }
}

enum SfxType {
  buttonTap,
  congrats,
  rotate,
  carStart,
}
