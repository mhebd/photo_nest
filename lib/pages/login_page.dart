import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState();

  double? deviceHeight, deviceWidth;
  final GlobalKey<FormState> _loginFormState = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();

  void _handleLogin() {
    bool isValid = _loginFormState.currentState!.validate();
    if (isValid) {
      Navigator.pushNamed(context, 'home');
    }
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _logoAndTitle(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _loginForm(),
              const SizedBox(height: 40),
              _loginButton(),
            ],
          ),
          _registerButton(),
        ],
      ),
    )));
  }

  // Logo and title widget
  Widget _logoAndTitle() {
    return const Text(
      'PhotoNest',
      style: TextStyle(
        fontSize: 22,
        fontFamily: "Lobster",
      ),
    );
  }

  // Login form widget
  Widget _loginForm() {
    return Form(
      key: _loginFormState,
      child: Column(
        children: [
          TextFormField(
            controller: _email,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Enter valid email',
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.contains(RegExp(
                  r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"))) {
                return null;
              } else {
                return 'Must be use a valid email.';
              }
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _password,
            decoration: const InputDecoration(
                labelText: 'Password', hintText: "Enter your password"),
            obscuringCharacter: '*',
            obscureText: true,
            validator: (value) {
              if (value!.length < 6) {
                return 'Password must be atleast 6 character long';
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }

  // Login button widget
  Widget _loginButton() {
    return MaterialButton(
      onPressed: _handleLogin,
      color: Colors.red,
      minWidth: deviceWidth! * 0.6,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: const Text(
        'Log In',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Register route widget
  Widget _registerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Not have an account?'),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'register');
          },
          child: const Text(
            'Register Now',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
