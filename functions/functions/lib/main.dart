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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void incrementarContador(int valor){
    setState(() { // actuliza estado contador y lo veo en la UI 
      _counter = suma(_counter, valor);
    });
    imprimirMensaje(); // llamada a funcion que imprime el valor del contador en la consola 
  }

  void imprimirMensaje(){
     print('Counter: + $_counter');
  }

  int suma(int a, int b){
    final int resultado = a + b;
    return resultado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => incrementarContador(2),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

/*
  APUNTES TEORICOS DE FUNCIONES

  // Funciones anonimas
() {
   codificacion funcionalidad
}

//Name functions (las que tienen nombre vaya)
void saludar() {
  // codificacion funcionalidad
  print("Hola!");
}

//Name functions with parameters (las que tienen nombre vaya)
void suma(int a, int b) {
  // codificacion funcionalidad
  print(a + b);
}

//retorned functions with parameters (me devuelve un valor)
int sumaEnteros(int a, int b) {
  // codificacion funcionalidad
  final int resultado = a + b; // final porque no puede ser modificado
  return resultado;
}
*/



