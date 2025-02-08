import '../models/question.dart';

abstract class TestState {}

class TestInitialState extends TestState {}

class TestInProgressState extends TestState {
  final List<Question> questions;
  final int currentIndex;
  final int yesCount;

  TestInProgressState({
    required this.questions,
    required this.currentIndex,
    required this.yesCount,
  });

  Question get currentQuestion => questions[currentIndex];
}

class TestCompletedState extends TestState {
  final double yesPercentage;

  TestCompletedState({required this.yesPercentage});
}
