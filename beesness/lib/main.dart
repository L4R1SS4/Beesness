// android:name=".MainActivity"
// android:theme="@style/LaunchTheme"

import 'package:flutter/material.dart';
import 'criarConta.dart';
import 'entrar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Beeness',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Beeness'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),*/
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Beesness',
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            const SizedBox(height: 15),

            Image.asset('images/logo.png', width: 110, height: 110,),

            const SizedBox(height: 50),

            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Entrar()),
                );
              },
              child: const Text('        Entrar        '),
            ),

            const SizedBox(height: 10),

            FilledButton.tonal(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CriarConta()),
                );
              },
              child: const Text('    Criar Conta    '),
            ),
          ],
        ),
      ),
    );
  }
}
