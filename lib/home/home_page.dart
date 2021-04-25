import 'package:NLW5/challenge/challenge_page.dart';
import 'package:NLW5/challenge/widgets/quiz/quiz_widget.dart';
import 'package:NLW5/core/core.dart';
import 'package:NLW5/home/home_controller.dart';
import 'package:NLW5/home/home_state.dart';
import 'package:NLW5/home/widgets/appbar/app_bar_widget.dart';
import 'package:NLW5/home/widgets/level_button/level_button_widget.dart';
import 'package:NLW5/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                LevelButtonWidget(
                  label: "Fácil",
                ),
                LevelButtonWidget(
                  label: "Médio",
                ),
                LevelButtonWidget(
                  label: "Difícil",
                ),
                LevelButtonWidget(
                  label: "Perito",
                ),
              ]),
              SizedBox(
                height: 24,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: controller.quizzes!
                    .map((e) => QuizCardWidget(
                          title: e.title,
                          percentage: e.questionAnswered / e.questions.length,
                          completed:
                              "${e.questionAnswered} de ${e.questions.length}",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChallengePage(
                                          questions: e.questions,
                                          title: e.title,
                                        )));
                          },
                        ))
                    .toList(),
              ))
            ],
          ),
        ),
      );
    } else
      return Scaffold(
          body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
        ),
      ));
  }
}
