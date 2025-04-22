import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// dotenv 환경변수 로딩
val dotenv = Properties()
val envFile = rootProject.file("../asset/config/.env")

if (envFile.exists()) {
    dotenv.load(FileInputStream(envFile))
} else {
    throw GradleException("Could not find .env file at: ${envFile.path}")
}

android {
    namespace = "com.example.chool_check"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"


    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.chool_check"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = 21
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        val googleKey = dotenv["GOOGLE_MAPS_API_KEY"] as? String
        if (googleKey == null) {
            throw GradleException("GOOGLE_MAPS_API_KEY not found in .env file")
        }
        manifestPlaceholders["google_maps_api_key"] = googleKey
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
    buildFeatures {
        buildConfig = true //
    }
}

flutter {
    source = "../.."
}