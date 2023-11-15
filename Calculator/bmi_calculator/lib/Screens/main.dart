import 'package:flutter/material.dart';

import 'Results_page.dart';
import 'input_page.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/input':(context) => const InputPage(),
        '/result':(context) => const Results_page()
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor:const Color(0xff0a0d22),
        appBarTheme:const AppBarTheme(
          backgroundColor: Color(0xff0a0d22),
        ),
          scaffoldBackgroundColor: const Color(0xFF0a0d22),
      ),
      initialRoute: '/input',
    );
  }
}


