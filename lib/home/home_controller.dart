import 'package:NLW5/core/app_images.dart';
import 'package:NLW5/home/home_repository.dart';
import 'package:NLW5/shared/models/answer_model.dart';
import 'package:NLW5/shared/models/question_model.dart';
import 'package:NLW5/shared/models/quiz_model.dart';
import 'package:NLW5/shared/models/user_model.dart';
import 'package:NLW5/home/home_state.dart';
import 'package:flutter/material.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
