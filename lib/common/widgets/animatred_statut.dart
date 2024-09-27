import 'package:appbar/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AnimatedStatusRow extends StatelessWidget {
  final int currentPage;

  const AnimatedStatusRow({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Description Step
        buildStep(
          isCompleted: currentPage > 0,
          isActive: currentPage == 0,
          label: 'Description',
        ),
        buildLine(isCompleted: currentPage > 0),
        // Location Step
        buildStep(
          isCompleted: currentPage > 1,
          isActive: currentPage == 1,
          label: 'Location',
        ),
        buildLine(isCompleted: currentPage > 1),
        // Otp Step
        buildStep(
          isCompleted: currentPage > 2,
          isActive: currentPage == 2,
          label: 'Otp',
        ),
      ],
    );
  }

  Widget buildStep({
    required bool isCompleted,
    required bool isActive,
    required String label,
  }) {
    Decoration activeDecoration = const BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.primaryBlue,
    );
    Decoration inactiveDecoration = BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.transparent,
      border: Border.all(color: Colors.grey),
    );
    Decoration completeDecoration = const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.green,
    );

    DecorationTween decorationTween;
    if (isCompleted) {
      decorationTween = DecorationTween(
        begin: inactiveDecoration,
        end: completeDecoration,
      );
    } else if (isActive) {
      decorationTween = DecorationTween(
        begin: inactiveDecoration,
        end: activeDecoration,
      );
    } else {
      decorationTween = DecorationTween(
        begin: inactiveDecoration,
        end: inactiveDecoration,
      );
    }

    return Row(
      children: [
        TweenAnimationBuilder<Decoration>(
          tween: decorationTween,
          duration: const Duration(milliseconds: 300),
          builder: (context, decoration, child) {
            return Container(
              height: 21,
              width: 21,
              padding: const EdgeInsets.all(2),
              decoration: decoration,
              child: Center(
                child: Icon(
                  isCompleted ? Icons.check : null,
                  color: isCompleted ? Colors.white : Colors.transparent,
                  size: 14,
                ),
              ),
            );
          },
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget buildLine({required bool isCompleted}) {
    return Row(
      children: [
        const SizedBox(width: 4),
        Container(
          height: 2,
          width: 40,
          color: AppColors.primaryGrey,
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
