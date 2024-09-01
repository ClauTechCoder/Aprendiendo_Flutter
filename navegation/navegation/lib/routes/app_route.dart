import 'package:flutter/material.dart';
import 'package:navegation/routes/routes.dart';
import 'package:navegation/screens/screen_1.dart';
import 'package:navegation/screens/screen_2.dart';


class AppRouter {
  // Aquí voy a almacenar todas las rutas del proyecto
  static Route onGenerateRoute(RouteSettings settings) { // Cambié "setting" a "settings"
      switch (settings.name) { // Cambié "setting" a "settings"
        case Routes.screen1:
          return MaterialPageRoute(builder: (context) => Screen1());
        case Routes.screen2:
          return MaterialPageRoute(builder: (context) => Screen2()); // Aquí también corregí Screen1 a Screen2
        default:
          return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'), // Cambié "setting" a "settings"
                ),
              ),
            );  
    }
  }
}
