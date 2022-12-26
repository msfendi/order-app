import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ptik_food/firebase_options.dart';
import 'package:ptik_food/pages/home_screen/home_screen_view.dart';
import 'package:ptik_food/pages/login_screen/login_screen_view.dart';
import 'package:ptik_food/pages/slider_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Login_screenPage(),
    );
  }
}
