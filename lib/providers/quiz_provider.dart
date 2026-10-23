
import 'package:flutter/material.dart';
import '../data/quiz_data.dart';

class QuizProvider extends ChangeNotifier {
  int _currentQuestion = 0;
  final Map<int, int> _selectedAnswers = {};

  int get currentQuestion => _currentQuestion;

  int get totalQuestions => quizQuestions.length;

  List get questions => quizQuestions;

  Map<int, int> get selectedAnswers => _selectedAnswers;

  bool get isLastQuestion =>
      _currentQuestion == totalQuestions - 1;

  int get score {
    int totalScore = 0;

    for (int i = 0; i < quizQuestions.length; i++) {
      if (_selectedAnswers[i] ==
          quizQuestions[i].correctAnswer) {
        totalScore++;
      }
    }

    return totalScore;
  }

  void selectAnswer(int answerIndex) {
    if (_selectedAnswers.containsKey(_currentQuestion)) {
      return;
    }

    _selectedAnswers[_currentQuestion] = answerIndex;
    notifyListeners();
  }

  bool isAnswerSelected(int answerIndex) {
    return _selectedAnswers[_currentQuestion] == answerIndex;
  }

  void nextQuestion() {
    if (_currentQuestion < totalQuestions - 1) {
      _currentQuestion++;
      notifyListeners();
    }
  }

  void resetQuiz() {
    _currentQuestion = 0;
    _selectedAnswers.clear();
    notifyListeners();
  }
}
