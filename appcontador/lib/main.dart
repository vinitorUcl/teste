import 'dart:math'; // Import necessário para gerar números aleatórios
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontWeight: FontWeight.bold, // Deixa o texto em negrito
            fontSize: 18, // Define o tamanho padrão do texto
          ),
        ),
      ),
      home: const MyHomePage(title: 'Contador de Pessoas')
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
  int _contador = 0; // Contador
  final int _maxPessoa = 10; // Máximo de pessoas
  Color _backgroundColor = Colors.white; // Cor inicial do plano de fundo

  void _incrementCounter() {
    setState(() {
      _contador++; // Aumenta o contador
      _limiter();
    });
  }

  void _decreaseCounter() {
    setState(() {
      _contador--; // Diminui o contador
      if (_contador < 0) {
        _contador = 0;
      }
    });
  }

  void _limiter() {
    if (_contador > _maxPessoa) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Cuidado com o Contador"),
            content: Text("Limite de Pessoas Alcançado Cuidado"),
          );
        },
      );
    }
  }

  void _alterarCor() {
    setState(() {
      // Gera uma cor aleatória
      _backgroundColor = Color.fromARGB(
        255,
        Random().nextInt(256), // Valor aleatório para R
        Random().nextInt(256), // Valor aleatório para G
        Random().nextInt(256), // Valor aleatório para B
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador de pessoas"), // Título parte superior
      ),
      body: Container(
        color: _backgroundColor, // Define a cor de fundo
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Espaça os widgets
          children: <Widget>[
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Quantidade de Pessoas', // Texto em cima do contador
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Negrito
                        fontSize: 24, // Tamanho maior
                      ),
                    ),
                    Text(
                      '$_contador',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold, // Negrito
                        fontSize: 48, // Tamanho maior para o contador
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Espaça os botões
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: FloatingActionButton(
                      onPressed: _incrementCounter,
                      tooltip: 'Increment',
                      child: const Icon(
                        Icons.add,
                        size: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: Opacity(
                      opacity: _contador > 0 ? 1.0 : 0.5, // Reduz a opacidade quando desabilitado
                      child: FloatingActionButton(
                        onPressed: _contador > 0 ? _decreaseCounter : null, // Desabilita o botão
                        tooltip: 'Decrement',
                        child: const Icon(Icons.remove, size: 50),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: FloatingActionButton(
                      onPressed: _alterarCor,
                      tooltip: 'Color Change',
                      child: const Icon(
                        Icons.color_lens,
                        size: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
