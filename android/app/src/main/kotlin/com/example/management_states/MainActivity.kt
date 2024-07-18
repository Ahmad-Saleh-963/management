package com.ahmadsaleh.managementstates
package com.example.yourapp

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugins.firebase.messaging.FlutterFirebaseMessagingBackgroundService

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }

    override fun onResume() {
        super.onResume()
        FlutterFirebaseMessagingBackgroundService.setPluginRegistrant(this)
    }
}
