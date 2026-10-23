
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String label;
  final String optionLetter;
  final bool isSelected;
  final bool isCorrect;
  final bool hasAnswered;
  final VoidCallback onTap;

  const AnswerButton({
    super.key,
    required this.label,
    required this.optionLetter,
    required this.isSelected,
    required this.isCorrect,
    required this.hasAnswered,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color borderColor = Colors.grey.shade300;
    Color backgroundColor = Colors.white;
    Color letterColor = const Color(0xFF6C63FF);

    if (hasAnswered && isCorrect) {
      borderColor = Colors.green;
      backgroundColor = Colors.green.withValues(alpha: 0.08);
      letterColor = Colors.green;
    } else if (hasAnswered && isSelected) {
      borderColor = Colors.red;
      backgroundColor = Colors.red.withValues(alpha: 0.06);
      letterColor = Colors.red;
    } else if (isSelected) {
      borderColor = const Color(0xFF6C63FF);
      backgroundColor = const Color(0xFFE8E5FF);
    }

    return InkWell(
      onTap: hasAnswered ? null : onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: borderColor,
            width: 1.8,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: borderColor.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Text(
                optionLetter,
                style: TextStyle(
                  color: letterColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (hasAnswered && isCorrect)
              const Icon(
                Icons.check_circle,
                color: Colors.green,
              )
            else if (hasAnswered && isSelected)
              const Icon(
                Icons.cancel,
                color: Colors.red,
              ),
          ],
        ),
      ),
    );
  }
}
