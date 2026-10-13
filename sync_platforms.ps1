# Neon Sandbox Pro - Workflow Sync Studio <-> AndroidIDE
# Final V31 - Stable Bidirectional Sync

$PROJECT_ROOT = "C:\Users\thoma\workspace_neon"
$PHONE_PATH = "/storage/emulated/0/AndroidIDEProjects/workspace_neon"

Write-Host "--- NEON SYNC WORKFLOW (V31) ---" -ForegroundColor Cyan

# 1. Check ADB connection
$devices = adb devices | Select-String "device$"
if ($null -eq $devices) {
    Write-Host "CRITICAL: No device found via ADB. Please connect your phone." -ForegroundColor Red
    exit
}

Write-Host "Step 1: Pushing Local (Studio) Changes to AndroidIDE..." -ForegroundColor Yellow
# Pushing only source and gradle files, ignoring build/cache to avoid mobile lag
adb shell "mkdir -p $PHONE_PATH"
adb push "$PROJECT_ROOT\app\src\." "$PHONE_PATH/app/src/"
adb push "$PROJECT_ROOT\build.gradle.kts" "$PHONE_PATH/"
adb push "$PROJECT_ROOT\settings.gradle.kts" "$PHONE_PATH/"
adb push "$PROJECT_ROOT\gradle\." "$PHONE_PATH/gradle/"
adb push "$PROJECT_ROOT\gradlew" "$PHONE_PATH/"
adb push "$PROJECT_ROOT\gradlew.bat" "$PHONE_PATH/"

Write-Host "Step 2: Cleaning AndroidIDE remote cache..." -ForegroundColor Gray
adb shell "rm -rf $PHONE_PATH/app/build"

Write-Host "Step 3: Verifying AndroidIDE Project Structure..." -ForegroundColor Yellow
$check = adb shell "ls $PHONE_PATH/app/src/commonMain/kotlin/com/sandbox/creator/neon/sandbox/SandboxState.kt"
if ($check -like "*No such file*") {
    Write-Host "ERROR: Sync failed. Check ADB permissions." -ForegroundColor Red
} else {
    Write-Host "SUCCESS: Android Studio and AndroidIDE are now in sync." -ForegroundColor Green
    Write-Host "You can now open the project in AndroidIDE on your phone and Build." -ForegroundColor Cyan
}

Write-Host "`nReady for Version 31 Final Build." -ForegroundColor White
