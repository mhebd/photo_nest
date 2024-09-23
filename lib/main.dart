import 'package:flutter/material.dart';
import 'package:photo_nest/pages/login_page.dart';
import 'package:photo_nest/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "login",
      routes: {
        "login": (context) => const LoginPage(),
        "register": (context) => const RegisterPage(),
      },
    );
  }
}
