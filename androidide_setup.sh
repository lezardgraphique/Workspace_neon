#!/bin/bash
echo "Setting up Java/Gradle environment for AndroidIDE..."
# Ensure permissions
chmod +x ./gradlew
# Pre-download dependencies if online
./gradlew --version
echo "Setup complete. You can now use the Layout Preview on SandboxPreview.kt"
