import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'application/app.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'core/injection_container.dart' as dependency_injection;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initialMainFunctions();
  runApp(MyApp());
}
initialMainFunctions()async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId('b9c421be-5f11-4a97-a225-63fe53417667');
  OneSignal.shared.setOnWillDisplayInAppMessageHandler((message) {
    print("ON WILL DISPLAY IN APP MESSAGE ${message.jsonRepresentation()}");
  });
  await dependency_injection.init();
}

//Platform  Firebase App Id
// web       1:470643046322:web:a2ad9baf53fe51118096ab
// android   1:470643046322:android:a38f777ba8bc24948096ab
// ios       1:470643046322:ios:4d6a65cba25ac94d8096ab
