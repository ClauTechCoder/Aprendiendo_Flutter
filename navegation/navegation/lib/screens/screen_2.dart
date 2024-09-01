import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 2'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // me lleva atras, pop -> atras, push -> adelante, de manera aprox
            Navigator.pop(context);
          }, 
          child: const Text('Volver a la Screen 1'),
        ),
      ),
    );
  }
}