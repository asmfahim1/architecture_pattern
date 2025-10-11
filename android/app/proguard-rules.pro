# Flutter & Dart
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep all annotated JSON classes (optional if using json_serializable or Gson)
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}
-keep class *.model.** { *; }

# Firebase (optional)
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# Keep Android Play Core classes
-keep class com.google.android.play.core.** { *; }
-dontwarn com.google.android.play.core.**

# Keep Flutter deferred components
-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }
-dontwarn io.flutter.embedding.engine.deferredcomponents.**

# Keep TensorFlow Lite GPU delegate
-keep class org.tensorflow.lite.gpu.** { *; }
-dontwarn org.tensorflow.lite.gpu.**

# Keep Kotlin metadata
-keep class kotlin.Metadata { *; }

# Reflection safety
-keepattributes Signature
-keepattributes *Annotation*

# Avoid obfuscating main app entry
-keep class com.yourcompany.yourapp.** { *; }  # <-- change this to match your package name
