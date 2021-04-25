import 'package:NLW5/core/core.dart';
import 'package:NLW5/shared/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int lenght;
  const QuestionIndicatorWidget(
      {Key? key, required this.currentPage, required this.lenght})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Questão $currentPage", style: AppTextStyles.body),
                Text("de $lenght", style: AppTextStyles.body)
              ],
            ),
            SizedBox(height: 16),
            ProgressIndicatorWidget(
              value: currentPage / lenght,
            ),
          ],
        ),
      ),
    );
  }
}
