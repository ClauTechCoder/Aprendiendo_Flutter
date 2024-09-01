import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'BebasNeue'),
      home: const Scaffold(
        body: Stack( // stack -> elemento apilado con otro
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Image(
              // IMAGEN GUARDADA EN PC: image: AssetImage('assets/images/avion.jpg'),
              image: NetworkImage('https://content.nationalgeographic.com.es/medio/2023/07/27/planeta-tierra-visto-desde-el-espacio_175cbda9_1428716920_230727124146_800x800.jpg'),
              fit: BoxFit.cover, // ajustar imagen al tamaño del contenido
            ),
            Positioned(
              top: 400,
              child: Text(
                'Hola Mundo!', 
                style: TextStyle(fontSize: 48, color: Colors.greenAccent, letterSpacing: 8),
                textAlign: TextAlign.center, // centrar texto
              )
            )
          ],
            
        ),
      ),
    );
  }
}


