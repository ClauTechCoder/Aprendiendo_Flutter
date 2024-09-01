import 'package:flutter/material.dart';
import 'package:navegation/routes/routes.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            /*
             navegacion anonima a la screen 2. push(,ruta)
            Navigator.push(context, 
              MaterialPageRoute(builder: (context) => Screen2()));
              */
            // navegacion con nombre por asi decirlo
            Navigator.pushNamed(context, Routes.screen2);
          }, 
          child: const Text('Ir a la Screen 2'),
        ),
      ),
    );
  }
}