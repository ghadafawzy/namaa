import '../models/question.dart';

abstract class TestEvent {}

class StartTestEvent extends TestEvent {
  final List<Question> questions;
  StartTestEvent({required this.questions});
}

class AnswerQuestionEvent extends TestEvent {
  final String answer;
  AnswerQuestionEvent({required this.answer});
}
