import 'package:flutter/material.dart';
import 'package:quiz/resultados.dart';
import 'package:quiz/quiz_dados.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int perguntaNumero = 1;
  int acertos = 0;
  int erros = 0;

  @override
  Widget build(BuildContext context) {
    quiz.shuffle();

    quiz.forEach((elemento) {
      int alternativa_correta = elemento['alternativa_correta'];
      List respostas = elemento['respostas'];

      String respostaCorreta = elemento['respostas'][alternativa_correta - 1];

      respostas.shuffle();
      int i = 1;
      respostas.forEach((elemento) {
        if (elemento == respostaCorreta) {
          alternativa_correta = i;
        }
        i++;
      });

      elemento['alternativa_correta'] = alternativa_correta;
    });

    void respondeu(int respostaNumero) {
      setState(() {
        if (quiz[perguntaNumero - 1]['alternativa_correta'] == respostaNumero) {
          print('acertou');
          acertos++;
        } else {
          print('errou');
          erros++;
        }

        print('acertos totais: $acertos erros totais: $erros');

        if (perguntaNumero == 10) {
          print('Terminou o Quiz');
          Navigator.pushNamed(context, 'Resultado',
              arguments: Argumentos(acertos));
        } else {
          perguntaNumero++;
        }
      });
    }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'Pergunta $perguntaNumero de 10',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text('Pergunta:\n' + quiz[perguntaNumero - 1]['pergunta'],
                  style: TextStyle(fontSize: 20)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('pressionado 1');
                    respondeu(1);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]['respostas'][0],
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.blue.shade500),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('pressionado 2');
                    respondeu(2);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]['respostas'][1],
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.blue.shade500),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('pressionado 3');
                    respondeu(3);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]['respostas'][2],
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.blue.shade500),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    print('pressionado 4');
                    respondeu(4);
                  },
                  child: Text(
                    quiz[perguntaNumero - 1]['respostas'][3],
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
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
    );
  }
}
