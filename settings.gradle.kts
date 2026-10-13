pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
    }
}
rootProject.name = "SandboxModuleCreator"
include(":app")
// Optionnel : redirige les dossiers build vers un cache externe (ex. sur ton PC).
// À définir dans ~/.gradle/gradle.properties (jamais dans le dépôt) :
//   neon.buildCachePath=C:/Users/thoma/gradle_build_cache/MyApplication
val buildCachePath: String? = providers.gradleProperty("neon.buildCachePath").orNull
if (buildCachePath != null) {
    gradle.projectsLoaded {
        rootProject.allprojects {
            @Suppress("DEPRECATION")
            buildDir = file("$buildCachePath/" + project.path.replace(":", "/"))
        }
    }
}
