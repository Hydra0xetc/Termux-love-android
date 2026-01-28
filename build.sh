#!/usr/bin/env bash

set -xe

# Configuration
JAVA_HOME="$PREFIX/lib/jvm/java-17-openjdk/"
ANDROID_SDK_ROOT="$HOME/android-sdk"
ANDROID_HOME="$HOME/android-sdk"
ANDROID_NDK_HOME="$HOME/android-ndk-r29"
CMAKE_PROGRAM="$PREFIX/bin/cmake"
KEYSTORE_FILE="$(pwd)/my-key.keystore"
KEYSTORE_PASSWORD="your password"
KEY_ALIAS="your-key-alias"
KEY_PASSWORD="your password"
AAPT2="$HOME/android-sdk/build-tools/35.0.0/aapt2"

if [ ! -f "$KEYSTORE_FILE" ]; then
    echo "Generating keystore..."
    keytool -genkeypair -v \
            -keystore "$KEYSTORE_FILE" \
            -alias "$KEY_ALIAS" \
            -keyalg RSA \
            -keysize 2048 \
            -validity 10000 \
            -storepass "$KEYSTORE_PASSWORD" \
            -keypass "$KEY_PASSWORD" \
            -dname "CN=Android Developer" 2>/dev/null
    echo "Keystore created at: $KEYSTORE_FILE"
else
    echo "Keystore already exists: $KEYSTORE_FILE"
fi

# Build instruction

echo "Done"
