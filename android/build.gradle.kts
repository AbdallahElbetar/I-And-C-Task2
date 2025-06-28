buildscript {
    dependencies {
        // ✅ مهم جدًا: إضافة Google Services Plugin لـ Firebase
        classpath("com.google.gms:google-services:4.4.1")
    }

    repositories {
        google()
        mavenCentral()
    }
}


 
allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// 🔧 تغيير مجلد البناء الافتراضي (لو مطلوب)
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
