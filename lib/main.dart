import 'package:beginner_app/firebase_options.dart';
import 'package:beginner_app/view/flutter_riverpod.dart';
import 'package:beginner_app/view/flutter_fire.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 50, 149, 220)),
      ),
      routes: {
        "/": (context) => const BeginnerApp(
              title: "Todo App",
            ),
        "/fire": (context) => const BeginnerAppTwo()
      },
    );
  }
}
