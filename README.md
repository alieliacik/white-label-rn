# White Labeling

This project supports white labeling, allowing you to create branded versions of the app with different names, bundle IDs, and assets.

## White Labeling Process

To create a new white labeled version of the app, follow these steps:

1. Prepare your brand assets:

   - Create a new folder in `brandedAppAssets/` with your brand name
   - Add the following files to your brand folder:
     - `Logo.png` - Your app logo
     - `Splash.png` - Your splash screen image

2. Run the white labeling script:

```sh
./whitelabel.sh "<AppName>" "<BundleID>" "<BrandAssetsFolder>"
```

For example:

```sh
./whitelabel.sh "MyNewApp" "com.mycompany.mynewapp" "CircularMaterials"
```

The script will:

- Rename your React Native app
- Update iOS pods
- Copy and configure your brand assets
- Set up the correct bundle ID

### Required Parameters

- `<AppName>`: The name of your new app
- `<BundleID>`: The bundle identifier (e.g., com.company.appname)
- `<BrandAssetsFolder>`: The name of your brand assets folder in `brandedAppAssets/`

### Asset Requirements

- Logo: Should be a high-quality PNG file
- Splash Screen: Should be a high-quality PNG file

After white labeling, verify the assets in:

- iOS: `ios/<AppName>/Images.xcassets/`
- Android: `android/app/src/main/res/`

# Troubleshooting

If you're having issues getting the above steps to work, see the [Troubleshooting](https://reactnative.dev/docs/troubleshooting) page.

# Learn More

To learn more about React Native, take a look at the following resources:

- [React Native Website](https://reactnative.dev) - learn more about React Native.
- [Getting Started](https://reactnative.dev/docs/environment-setup) - an **overview** of React Native and how setup your environment.
- [Learn the Basics](https://reactnative.dev/docs/getting-started) - a **guided tour** of the React Native **basics**.
- [Blog](https://reactnative.dev/blog) - read the latest official React Native **Blog** posts.
- [`@facebook/react-native`](https://github.com/facebook/react-native) - the Open Source; GitHub **repository** for React Native.

## Test Script:

./whitelabel.sh "CircularMaterials" "com.circular.materials" "CircularMaterials"
./whitelabel.sh "GarbologyGenius" "com.garbologygenius" "GarbologyGenius"

npx react-native run-ios
