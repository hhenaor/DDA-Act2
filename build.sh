#!/bin/bash
set -e

echo "Building Flutter release APK..."
flutter build apk --release

echo "Copying APK to project root..."
cp build/app/outputs/flutter-apk/app-release.apk .

echo "Script finished. APK is now in the root directory."