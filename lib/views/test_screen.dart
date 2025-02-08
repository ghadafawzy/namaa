import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/test_bloc.dart';
import '../bloc/test_event.dart';
import '../bloc/test_state.dart';
import '../models/local_model.dart';



class TestPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الاختبار')),
      body: BlocProvider(
        create: (context) => TestBloc()..add(StartTestEvent(questions: questions)),
        child: BlocBuilder<TestBloc, TestState>(
          builder: (context, state) {
            if (state is TestInProgressState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Center(
                            child: Text(state.currentQuestion.text,
                                style: TextStyle(fontSize: 22)),
                        ),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      child: Text('نعم' ,style: TextStyle(fontSize: 22)),
                      onPressed: () => context.read<TestBloc>().add(AnswerQuestionEvent(answer: 'نعم'))),
                  SizedBox(height: 15,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text('لا', style: TextStyle(fontSize: 25)),
                      onPressed: () => context.read<TestBloc>().add(AnswerQuestionEvent(answer: 'لا'))),
                ],
              );
            } else if (state is TestCompletedState) {
              Future.microtask(() => Navigator.pushReplacementNamed(context, '/result', arguments: state.yesPercentage));
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
