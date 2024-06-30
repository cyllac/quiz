import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado({super.key, required this.acertos});

  final int? acertos;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Quiz Curso de Fluetter & Dart',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue.shade400,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Resultado', style: TextStyle(fontSize: 20)),
                Text('Você acertou\n$acertos de 10\nperguntas',
                    style: TextStyle(fontSize: 20)),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => {print('pressionado')},
                    child: Text(
                      'Jogar Novamente',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        backgroundColor: Colors.blue.shade500),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
