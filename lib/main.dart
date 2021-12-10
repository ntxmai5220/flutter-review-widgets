import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables(); //ENVI
  await Firebase.initializeApp();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FlutterConfig.get("APP_NAME"),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: NewScreen(),
    );
  }
}

class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _firebaseCrash() async {
      FirebaseCrashlytics.instance.crash();
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    }

    return Center(
      child: ElevatedButton(
        child: Text(FlutterConfig.get("APP_NAME")),
        onPressed: () {
          _firebaseCrash();
        },
      ),
    );
  }
}
