
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/quiz_provider.dart';
import '../routes/routes_app.dart';
import '../widgets/answer_button.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final size = MediaQuery.sizeOf(context);

    final question = quiz.questions[quiz.currentQuestion];

    final selectedAnswer =
        quiz.selectedAnswers[quiz.currentQuestion];

    final hasAnswered = selectedAnswer != null;

    final isCorrect = hasAnswered &&
        selectedAnswer == question.correctAnswer;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz Time',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => _showExitDialog(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * 0.06),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOMOR DAN PROGRES SOAL
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Question ${quiz.currentQuestion + 1} '
                    'of ${quiz.totalQuestions}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${((quiz.currentQuestion + 1) / quiz.totalQuestions * 100).round()}%',
                    style: const TextStyle(
                      color: Color(0xFF6C63FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: (quiz.currentQuestion + 1) /
                      quiz.totalQuestions,
                  minHeight: 8,
                  backgroundColor: const Color(0xFFE8E5FF),
                  color: const Color(0xFF6C63FF),
                ),
              ),

              const SizedBox(height: 24),

              // GAMBAR PERTANYAAN
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  question.image,
                  width: double.infinity,
                  height: size.height * 0.23,
                  fit: BoxFit.cover,
                  loadingBuilder:
                      (context, child, progress) {
                    if (progress == null) {
                      return child;
                    }

                    return Container(
                      height: size.height * 0.23,
                      width: double.infinity,
                      color: const Color(0xFFE8E5FF),
                      alignment: Alignment.center,
                      child:
                          const CircularProgressIndicator(),
                    );
                  },
                  errorBuilder:
                      (context, error, stackTrace) {
                    return Container(
                      height: size.height * 0.23,
                      width: double.infinity,
                      color: const Color(0xFFE8E5FF),
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.image_not_supported_outlined,
                        size: 48,
                        color: Color(0xFF6C63FF),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),

              // TEKS PERTANYAAN
              Text(
                question.question,
                style: TextStyle(
                  fontSize: size.width * 0.055,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 20),

              // PILIHAN JAWABAN
              ...List.generate(
                question.options.length,
                (index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 12),
                    child: AnswerButton(
                      label: question.options[index],
                      optionLetter:
                          String.fromCharCode(65 + index),
                      isSelected:
                          selectedAnswer == index,
                      isCorrect:
                          question.correctAnswer == index,
                      hasAnswered: hasAnswered,
                      onTap: () {
                        context
                            .read<QuizProvider>()
                            .selectAnswer(index);
                      },
                    ),
                  );
                },
              ),

              // REAKSI JAWABAN BENAR ATAU SALAH
              if (hasAnswered) ...[
                const SizedBox(height: 8),

                Center(
                  child: Image.asset(
                    isCorrect
                        ? 'assets/images/react_benar.png'
                        : 'assets/images/react_salah.png',
                    height: size.height * 0.13,
                    fit: BoxFit.contain,
                    errorBuilder:
                        (context, error, stackTrace) {
                      return Text(
                        isCorrect
                            ? 'Correct! 🎉'
                            : 'Not quite! 💪',
                        style: TextStyle(
                          fontSize: size.width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: isCorrect
                              ? Colors.green
                              : Colors.red,
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 12),

                Center(
                  child: Text(
                    isCorrect
                        ? 'Great job! Your answer is correct.'
                        : 'Keep going! Try the next question.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.width * 0.035,
                      fontWeight: FontWeight.w600,
                      color: isCorrect
                          ? Colors.green.shade700
                          : Colors.red.shade700,
                    ),
                  ),
                ),
              ],

              const SizedBox(height: 24),

              // TOMBOL SOAL BERIKUTNYA
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: !hasAnswered
                      ? null
                      : () {
                          if (quiz.isLastQuestion) {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.result,
                            );
                          } else {
                            context
                                .read<QuizProvider>()
                                .nextQuestion();
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF6C63FF),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor:
                        Colors.grey.shade300,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    quiz.isLastQuestion
                        ? 'See Result'
                        : 'Next Question',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // DIALOG KELUAR DARI KUIS
  void _showExitDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Exit Quiz?'),
          content: const Text(
            'Are you sure you want to leave this quiz?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Continue Quiz'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoutes.home,
                  (route) => false,
                );
              },
              child: const Text(
                'Exit',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
