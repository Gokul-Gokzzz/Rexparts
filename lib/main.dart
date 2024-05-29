import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rexparts/controller/bottom_provider.dart';
import 'package:rexparts/controller/carsoul_provider.dart';
import 'package:rexparts/controller/login_provider.dart';
import 'package:rexparts/controller/reg_provider.dart';
// import 'package:rexparts/controller/user_controller.dart';
import 'package:rexparts/firebase_options.dart';
import 'package:rexparts/view/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CaroselProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => UserProvider(),
        // ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegProvider(),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashScreen()),
    );
  }
}
