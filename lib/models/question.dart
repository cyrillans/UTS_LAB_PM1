
class Question {
  final String question;
  final List<String> options;
  final int correctAnswer;
  final String image;

  const Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
    required this.image,
  });
}
