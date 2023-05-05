import 'package:bank_app_2/ui/screens/loan_calculator_screen.dart';
import 'package:bank_app_2/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoanCalculatorScreen(),
      navigatorKey: NavigationUtils.navigatorKey,
    );
  }
}