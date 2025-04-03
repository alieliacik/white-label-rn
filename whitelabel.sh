#!/bin/bash

# Check if required parameters are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <AppName> <BundleID> <BrandAssetsFolder>"
    echo "Example: $0 BinFluncers com.rcbinfluncers CircularMaterials"
    exit 1
fi

APP_NAME=$1
BUNDLE_ID=$2
BRAND_ASSETS_FOLDER=$3

echo "Starting white labeling process..."
echo "App Name: $APP_NAME"
echo "Bundle ID: $BUNDLE_ID"
echo "Brand Assets Folder: $BRAND_ASSETS_FOLDER"

# Run react-native-rename
echo "Running react-native-rename..."
npx react-native-rename "$APP_NAME" -b "$BUNDLE_ID"

# Update iOS pods
echo "Updating iOS pods..."
cd ios
pod update
cd ..

# Copy and update iOS assets
echo "Updating iOS assets..."
IOS_APP_PATH="ios/$APP_NAME"
BRAND_ASSETS_PATH="brandedAppAssets/$BRAND_ASSETS_FOLDER"

# Copy logo
if [ -f "$BRAND_ASSETS_PATH/Logo.png" ]; then
    echo "Copying logo..."
    cp "$BRAND_ASSETS_PATH/Logo.png" "$IOS_APP_PATH/Images.xcassets/AppIcon.appiconset/Logo.png"
else
    echo "Warning: Logo.png not found in $BRAND_ASSETS_PATH"
fi

# Copy splash screen
if [ -f "$BRAND_ASSETS_PATH/Splash.png" ]; then
    echo "Copying splash screen..."
    cp "$BRAND_ASSETS_PATH/Splash.png" "$IOS_APP_PATH/Images.xcassets/Splash.imageset/Splash.png"
    cp "$BRAND_ASSETS_PATH/Splash.png" "$IOS_APP_PATH/Images.xcassets/Splash.imageset/Splash 1.png"
    cp "$BRAND_ASSETS_PATH/Splash.png" "$IOS_APP_PATH/Images.xcassets/Splash.imageset/Splash 2.png"
else
    echo "Warning: Splash.png not found in $BRAND_ASSETS_PATH"
fi

echo "iOS white labeling process completed!"

echo "White labeling process completed!"
echo "Please verify the assets in:"
echo "- iOS: ios/$APP_NAME/Images.xcassets/"
echo "Logo should be placed in:"
echo "- iOS: ios/$APP_NAME/Images.xcassets/AppIcon.appiconset/Logo.png"
echo "- Android: android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png"
echo ""
echo "Splash screen should be placed in:"
echo "- iOS: ios/$APP_NAME/Images.xcassets/Splash.imageset/Splash.png"
echo "- Android: android/app/src/main/res/drawable/splash.png" 