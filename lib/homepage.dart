import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
                Image.asset(
                  'assets/images/logo.jpg',
                  width: 320,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print('pressionado');
                      Navigator.pushNamed(context, 'Quiz');
                    },
                    child: Text(
                      'Jogar',
                      style: TextStyle(fontSize: 50, color: Colors.white),
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
      ),
    );
  }
}
