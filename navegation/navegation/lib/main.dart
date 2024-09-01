import 'package:flutter/material.dart';
import 'package:navegation/routes/app_route.dart';
import 'package:navegation/routes/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.screen1, // Ruta inicial, normalemente es '/'
      onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
    );
  }
}
