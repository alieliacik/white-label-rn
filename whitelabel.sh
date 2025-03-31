#!/bin/bash

# Check if required parameters are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <AppName> <BundleID>"
    echo "Example: $0 BinFluncers com.rcbinfluncers"
    exit 1
fi

APP_NAME=$1
BUNDLE_ID=$2

echo "Starting white labeling process..."
echo "App Name: $APP_NAME"
echo "Bundle ID: $BUNDLE_ID"

# Run react-native-rename
echo "Running react-native-rename..."
npx react-native-rename "$APP_NAME" -b "$BUNDLE_ID"

# Update iOS pods
echo "Updating iOS pods..."
cd ios
pod update
cd ..

echo "White labeling process completed!"
echo "Please provide logo and splash screen images to complete the process."
echo "Logo should be placed in:"
echo "- iOS: ios/$APP_NAME/Images.xcassets/AppIcon.appiconset/Icon-App-1024x1024@1x.png"
echo "- Android: android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png"
echo ""
echo "Splash screen should be placed in:"
echo "- iOS: ios/$APP_NAME/Images.xcassets/Splash.imageset/Splash.png"
echo "- Android: android/app/src/main/res/drawable/splash.png" 