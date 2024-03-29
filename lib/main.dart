// import 'package:dunzo/admin/add_food.dart';
// import 'package:dunzo/admin/admin_login.dart';
import 'package:dunzo/admin/home_admin.dart';
// import 'package:dunzo/pages/home.dart';
// import 'package:dunzo/pages/onboard.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application. 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DUNZO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      // home: const OnBoard(),
      home: const HomeAdmin(),
    );
  }
}