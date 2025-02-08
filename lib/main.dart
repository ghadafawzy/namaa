import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/test_bloc.dart';
import 'views/details_screen.dart';
import 'views/home_screen.dart';
import 'views/result_screen.dart';
import 'views/splash_screen.dart';
import 'views/test_screen.dart';
import 'views/user_form_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق متابعة تطور الطفل',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/form': (context) => UserFormPage(),
        '/test': (context) => BlocProvider(
          create: (context) => TestBloc(),
          child: TestPage(),
        ),
        '/result': (context) => ResultPage(),
        '/details': (context) => DetailsPage(),
      },
    );
  }
}
