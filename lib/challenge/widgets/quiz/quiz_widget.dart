import 'package:NLW5/challenge/widgets/answer/answer_widget.dart';
import 'package:NLW5/core/core.dart';
import 'package:NLW5/shared/models/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;
  const QuizWidget({Key? key, required this.question, required this.onSelected})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
                answer: widget.question.answers[i],
                disabled: indexSelected != -1,
                isSelected: indexSelected == i,
                onTap: (value) {
                  indexSelected = i;
                  setState(() {});
                  Future.delayed(Duration(seconds: 2))
                      .then((_) => widget.onSelected(value));
                }),
        ],
      ),
    );
  }
}
