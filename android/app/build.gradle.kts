plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.deneme"
    compileSdk = 33  // flutter.compileSdkVersion yerine sabit değer

    // ndkVersion isteğe bağlı, istersen aşağıdaki satırı kullanabilirsin:
    // ndkVersion = "21.4.7075529"

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.deneme"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 21  // flutter.minSdkVersion yerine sabit değer
        targetSdk = 33  // flutter.targetSdkVersion yerine sabit değer
        versionCode = 1  // flutter.versionCode yerine sabit değer
        versionName = "1.0"  // flutter.versionName yerine sabit değer
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}
