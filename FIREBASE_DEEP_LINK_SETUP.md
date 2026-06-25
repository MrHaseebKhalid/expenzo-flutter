# Firebase Deep Link Setup Instructions (No Dynamic Links)

## Overview
This document provides instructions for configuring Firebase deep links to enable automatic navigation when users click password reset or email verification links in emails.

**Important**: Firebase Dynamic Links has been deprecated by Google. This guide uses the recommended alternative: **Firebase Auth Email Action Handler** with **Universal Links (iOS)** and **App Links (Android)**.

## Prerequisites
- Firebase project created and configured
- Flutter app with Firebase Authentication set up
- Custom domain (e.g., `auth.expenzo.com`) for handling deep links
- App-side deep link handling already implemented in `lib/main.dart`

## Step 1: Configure Firebase Console

### 1.1 Go to Firebase Console
1. Navigate to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Go to **Authentication** → **Sign-in method**

### 1.2 Configure Email/Password Provider
1. Enable **Email/Password** provider
2. Click the **Options** (three dots) menu
3. Select **Action URLs**

### 1.3 Configure Custom Action URLs
Instead of using Firebase Dynamic Links (.page.link), configure your custom domain:

**Password Reset URL:**
- Format: `https://auth.expenzo.com/?mode=resetPassword&oobCode={oobCode}`
- Replace `auth.expenzo.com` with your custom domain

**Email Verification URL:**
- Format: `https://auth.expenzo.com/?mode=verifyEmail&oobCode={oobCode}`
- Replace `auth.expenzo.com` with your custom domain

**Important**: The domain must be HTTPS and must be configured with Universal Links (iOS) and App Links (Android).

## Step 2: Set Up Custom Domain

### 2.1 Choose a Domain
Select a subdomain for handling authentication deep links:
- Example: `auth.expenzo.com`
- This domain will be used for all Firebase Auth email actions

### 2.2 Configure DNS
1. Go to your domain registrar (e.g., Namecheap, GoDaddy, Cloudflare)
2. Add an A record or CNAME record pointing to your hosting
3. Ensure SSL/TLS certificate is configured (HTTPS required)

### 2.3 Verify Domain Ownership
1. In Firebase Console, go to **Authentication** → **Sign-in method** → **Action URLs**
2. Add your custom domain
3. Firebase will provide verification instructions (DNS TXT record or HTML file upload)
4. Complete the verification process

## Step 3: Configure Android App Links

### 3.1 Update AndroidManifest.xml
Add the following intent filter to `android/app/src/main/AndroidManifest.xml`:

```xml
<activity
    android:name=".MainActivity"
    android:exported="true"
    android:launchMode="singleTop"
    android:theme="@style/LaunchTheme"
    android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
    android:hardwareAccelerated="true"
    android:windowSoftInputMode="adjustResize">
    
    <!-- Existing intent filters -->
    
    <!-- Add this intent filter for App Links -->
    <intent-filter android:autoVerify="true">
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data
            android:scheme="https"
            android:host="auth.expenzo.com"
            android:path="/"/>
    </intent-filter>
</activity>
```

### 3.2 Create assetlinks.json
Create a file at `https://auth.expenzo.com/.well-known/assetlinks.json`:

```json
[{
  "relation": ["delegate_permission/common.handle_all_urls"],
  "target": {
    "namespace": "android_app",
    "package_name": "com.example.expenzo",
    "sha256_cert_fingerprints": [
      "YOUR_SHA256_FINGERPRINT_HERE"
    ]
  }
}]
```

To get your SHA256 fingerprint:
```bash
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android 2>/dev/null | grep SHA256
```

### 3.3 Update build.gradle
Add the following to `android/app/build.gradle`:

```gradle
android {
    // ... existing configuration
    
    defaultConfig {
        // ... existing configuration
        
        // Add this for deep linking
        manifestPlaceholders = [
            deepLinkHost: 'auth.expenzo.com'
        ]
    }
}
```

## Step 4: Configure iOS Universal Links

### 4.1 Update Info.plist
Add the following to `ios/Runner/Info.plist`:

```xml
<key>FlutterDeepLinkingEnabled</key>
<true/>
<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleTypeRole</key>
        <string>Editor</string>
        <key>CFBundleURLName</key>
        <string>auth.expenzo.com</string>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>https</string>
        </array>
    </dict>
</array>
```

### 4.2 Configure Associated Domains
1. In Xcode, open your project
2. Go to **Signing & Capabilities** tab
3. Click **+ Capability**
4. Select **Associated Domains**
5. Add: `applinks:auth.expenzo.com`

### 4.3 Create apple-app-site-association
Create a file at `https://auth.expenzo.com/.well-known/apple-app-site-association`:

```json
{
  "applinks": {
    "apps": [],
    "details": [
      {
        "appIDs": ["TEAMID.com.example.expenzo"],
        "components": [
          {
            "/": "/",
            "comment": "Matches any URL"
          }
        ]
      }
    ]
  }
}
```

Replace `TEAMID` with your Apple Team ID and `com.example.expenzo` with your bundle identifier.

## Step 5: Update App-Side Deep Link Handling

The app-side deep link handling is already implemented in `lib/main.dart`:

```dart
onGenerateRoute: (settings) {
  // Handle Firebase deep links for password reset and email verification
  final uri = Uri.tryParse(settings.name ?? '');
  if (uri != null && uri.queryParameters.containsKey('oobCode')) {
    final oobCode = uri.queryParameters['oobCode'];
    final mode = uri.queryParameters['mode'];
    
    if (mode == 'resetPassword' && oobCode != null) {
      // Navigate to password reset screen with oobCode
      return MaterialPageRoute(
        builder: (context) => EnterNewPasswordView(oobCode: oobCode),
      );
    }
    
    if (mode == 'verifyEmail' && oobCode != null) {
      // Email verification is handled automatically by Firebase
      // Navigate to sign in screen
      return MaterialPageRoute(
        builder: (context) => const EmailVerificationSentView(
          email: '', // Email will be extracted from the user
        ),
      );
    }
  }
  
  // Use default route handling
  return null;
}
```

## Step 6: Test Deep Links

### 6.1 Test Password Reset Flow
1. Request a password reset email in your app
2. Click the link in the email
3. The app should open and navigate to the password reset screen
4. Enter new password and confirm

### 6.2 Test Email Verification Flow
1. Sign up for a new account
2. Click the verification link in the email
3. The app should open and navigate to the verification screen
4. Click "I've Verified My Email" to confirm

### 6.3 Test on Real Device
Deep links (Universal Links and App Links) only work on real devices, not simulators/emulators.

## Troubleshooting

### Deep Link Not Opening App
- Verify AndroidManifest.xml intent filter is correct
- Check that the deep link domain matches Firebase Console configuration
- Ensure the app is installed on the device
- Verify assetlinks.json and apple-app-site-association are accessible
- Test with `adb shell am start -W -a android.intent.action.VIEW -d "https://auth.expenzo.com/?mode=resetPassword&oobCode=test" com.example.expenzo`

### oobCode Not Extracted
- Verify the action URL format in Firebase Console
- Check that the onGenerateRoute in main.dart is correctly parsing the URL
- Ensure the mode parameter is correctly set (resetPassword or verifyEmail)

### Email Verification Still Shows Not Verified
- Wait a few seconds after clicking the link before checking
- The app now has a double-reload mechanism to handle this
- Check Firebase Console logs for any errors

### Domain Verification Failed
- Ensure DNS records are correctly configured
- Verify SSL/TLS certificate is valid
- Check that the domain is accessible via HTTPS
- Wait for DNS propagation (can take up to 48 hours)

## Alternative: Use Firebase Auth Email Action Handler

If you prefer not to set up custom domain deep links, you can use Firebase's built-in email action handler:

1. In Firebase Console, configure action URLs to use Firebase's default domain
2. Users will click links that open in a browser
3. After completing the action in the browser, users manually return to the app
4. This is simpler but less seamless than deep linking

## Next Steps

1. Choose a custom domain for deep links
2. Configure DNS and SSL/TLS
3. Configure Firebase Console with custom action URLs
4. Set up Android App Links (Step 3)
5. Set up iOS Universal Links (Step 4)
6. Test the complete flow (Step 6)
7. Deploy to production

## Support

For additional help, refer to:
- [Firebase Authentication Documentation](https://firebase.google.com/docs/auth)
- [Android App Links Guide](https://developer.android.com/training/app-links)
- [iOS Universal Links Guide](https://developer.apple.com/documentation/xcode/allowing-apps-and-websites-to-link-to-your-content)
- [Flutter Deep Linking Guide](https://docs.flutter.dev/ui/navigation/deep-linking)
