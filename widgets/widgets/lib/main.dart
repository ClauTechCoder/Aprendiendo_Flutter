import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
// CREO MI PROPIO WIDGET

class HomePage extends StatefulWidget {
  const HomePage({super.key}); 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 // constructor del widget
 Color textColor = Colors.purple;
 void changeColor(Color color) {
  setState(() {
    textColor = color;
  });
 }
  @override 
  Widget build(BuildContext context) {
    return Scaffold(// tengo una pantalla donde ahora añadire cosas
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // los centra y los espacia
              children: [
                GestureDetector(
                  onTap: () { 
                    changeColor(Colors.red);
                    },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                ),
                GestureDetector(
                  onTap: () { 
                    changeColor(Colors.black);
                    },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () { 
                    changeColor(Colors.purple);
                    },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50,), // una manera de separar los botones del texto
            Text(
              'COLOR',
              style: TextStyle(fontSize: 48, color: textColor),
            ),
          ],
        ),
      ),
    ); 
  }
}
