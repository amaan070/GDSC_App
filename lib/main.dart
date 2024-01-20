import 'package:flutter/material.dart';
import 'package:gdsc_app/src/features/splash/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'src/firebase/firebase_options.dart';
import 'package:gdsc_app/src/theme/theme.dart';

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
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: defaultTheme,
      home: const Splash(),
    );
  }
}
