import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:donut_app_8sc/pages/home_page.dart';
import 'firebase_options.dart'; // Asegúrate de importar el archivo con las opciones

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Asegura la inicialización correcta
  await Firebase.initializeApp(
    options:
        firebaseOptions, // Usa las opciones de Firebase definidas en firebase_options.dart
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Donut App',
      theme: ThemeData(),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
