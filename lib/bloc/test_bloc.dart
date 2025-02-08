import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:namaa/bloc/test_event.dart';
import 'package:namaa/bloc/test_state.dart';
import '../models/question.dart';


class TestBloc extends Bloc<TestEvent, TestState> {
  List<Question> _questions = [];
  int _currentIndex = 0;
  int _yesCount = 0;

  TestBloc() : super(TestInitialState()) {
    on<StartTestEvent>((event, emit) {
      _questions = event.questions;
      _currentIndex = 0;
      _yesCount = 0;
      emit(TestInProgressState(
        questions: _questions,
        currentIndex: _currentIndex,
        yesCount: _yesCount,
      ));
    });

    on<AnswerQuestionEvent>((event, emit) {
      if (event.answer == 'نعم') {
        _yesCount++;
      }

      if (_currentIndex < _questions.length - 1) {
        _currentIndex++;
        emit(TestInProgressState(
          questions: _questions,
          currentIndex: _currentIndex,
          yesCount: _yesCount,
        ));
      } else {
        double yesPercentage = (_yesCount / _questions.length) * 100;
        emit(TestCompletedState(yesPercentage: yesPercentage));
      }
    });
  }
}
