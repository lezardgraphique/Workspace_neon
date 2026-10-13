# Neon Sandbox Pro V43

Neon Sandbox Pro is a powerful Kotlin Multiplatform (KMP) tool for building professional email modules with a focus on HubSpot (HuBL) compatibility.

## 🚀 Features

- **Real-time Bidirectional Sync**: Edit HuBL code and see changes in the UI instantly, and vice versa.
- **Gemini Flash 1.5 Integration**: AI-powered content generation and marketing optimization.
- **Advanced Layout Engine**: Support for 1, 2, and 3 columns with side-by-side or stack behaviors.
- **Interactive Preview**: Click directly on elements to configure them.
- **Mobile Optimized**: Specifically designed to work seamlessly on AndroidIDE (Mobile) and Android Studio (PC).
- **Nested Sections**: Create cards within cards for complex email structures.

## 🛠 Tech Stack

- **Kotlin Multiplatform (KMP)**
- **Compose Multiplatform**
- **Google AI SDK (Gemini)**
- **Coil 3** (Image Loading)

## 📱 Mobile Workflow

This project is configured for a unique bidirectional sync between PC (Android Studio) and Mobile (AndroidIDE) using ADB.

1. Edit on PC.
2. Run `./sync_platforms.ps1`.
3. Build and deploy directly from your phone.

## 📄 License

Proprietary - Developed for Thomas.

## \xf0\x9f\x94\x91 Configuration

Renseigne ta cl\xc3\xa9 Gemini dans `ApiConfig.kt` **en local uniquement** et ne la committe jamais.
