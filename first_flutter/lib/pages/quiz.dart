
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Quiz(),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestion = 0;
  int score = 0;

  // Le contenu du quiz
  final quiz = [
    {
      "title": "Question1",
      "answers": [
        {"answer": "answer11", "correct": false},
        {"answer": "answer12", "correct": false},
        {"answer": "answer13", "correct": true}
      ]
    },
    {
      "title": "Question2",
      "answers": [
        {"answer": "answer21", "correct": true},
        {"answer": "answer22", "correct": false},
        {"answer": "answer23", "correct": false}
      ]
    },
  ];

  // Méthode pour gérer la sélection des réponses
  void answerQuestion(bool correct) {
    setState(() {
      if (correct) {
        score++;
      }
      currentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: (currentQuestion >= quiz.length)
          ? Center(
              child: Text(
                'Score: ${(100 * score / quiz.length).toStringAsFixed(2)}%',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: <Widget>[
                // Afficher le numéro de la question
                ListTile(
                  title: Center(
                    child: Text(
                      "Question ${currentQuestion + 1}/${quiz.length}",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Afficher la question
                ListTile(
                  title: Center(
                    child: Text(
                      quiz[currentQuestion]['title'] as String,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                // Afficher les réponses comme des boutons
                ...(quiz[currentQuestion]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return ListTile(
                    title: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                            255, 3, 35, 244), // Background color
                        foregroundColor: Colors.white, // Text color
                        padding: EdgeInsets.all(16.0),
                      ),
                      onPressed: () =>
                          answerQuestion(answer['correct'] as bool),
                      child: Text(
                        answer['answer'].toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
    );
  }
}