import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/loginScreen.dart'; // Import de la page de connexion


import 'screens/loginScreen.dart';
import 'screens/categories_screen.dart'; // Import de la page de connexion


void main() {
  runApp(
    ProviderScope( // 💡 Ajoute ceci pour activer Riverpod
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(), // Démarrer avec la page de connexion
    );
  }

}

