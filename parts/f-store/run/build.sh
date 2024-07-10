#!/bin/bash
set -euo pipefail
source /home/sb/Documents/test-dev/flutter/f_store/parts/f-store/run/environment.sh
set -x
git clone --depth 1 -b stable https://github.com/flutter/flutter.git /home/sb/Documents/test-dev/flutter/f_store/parts/f-store/build/flutter-distro
flutter precache --linux
flutter pub get
flutter build linux --release --verbose --target lib/main.dart
cp -r build/linux/*/release/bundle/* $CRAFT_PART_INSTALL/
