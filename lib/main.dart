import 'package:flutter/material.dart';
import 'package:gdsc_app/src/auth/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gdsc_app/src/theme/dark_theme.dart';
import 'package:gdsc_app/src/theme/theme_changer.dart';
import 'package:provider/provider.dart';
import 'src/services/firebase/firebase_options.dart';
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
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ThemeChanger())],
      child: Builder(builder: ((context) {
        final themeChanger = Provider.of<ThemeChanger>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeChanger.themeMode,
          theme: defaultTheme,
          darkTheme: darkTheme,
          home: const Splash(),
        );
      })),
    );
  }
}
