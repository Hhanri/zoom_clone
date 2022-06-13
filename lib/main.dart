import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/colors.dart';
import 'package:zoom_clone/utils/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      onGenerateRoute: AppRouter().onGenerate,
    );
  }
}

