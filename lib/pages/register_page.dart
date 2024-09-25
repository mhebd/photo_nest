import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  _RegisterPageState();

  double? deviceHeight, deviceWidth;
  final GlobalKey<FormState> _loginFormState = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  Uint8List? image;

  void _handleLogin() {
    bool isValid = _loginFormState.currentState!.validate();
    if (isValid) {
      print(_name.text);
      print(_email.text);
      print(_password.text);
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
              _profilePhoto(),
              const SizedBox(height: 40),
              _loginForm(),
              const SizedBox(height: 40),
              _registerButton(),
            ],
          ),
          _loginButton(),
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

  // Profile photo widget
  Widget _profilePhoto() {
    return Center(
      child: GestureDetector(
        onTap: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();

          if (result != null) {
            setState(() {
              image = result.files.single.bytes!;
            });
          }
        },
        child: Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            color: Colors.white38,
          ),
          child: image != null
              ? Image.memory(image!, fit: BoxFit.cover)
              : const Center(
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
        ),
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
            controller: _name,
            decoration: const InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your name',
            ),
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Must be provide a name';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 20),
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
  Widget _registerButton() {
    return MaterialButton(
      onPressed: _handleLogin,
      color: Colors.red,
      minWidth: deviceWidth! * 0.6,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: const Text(
        'Sign Up',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Register route widget
  Widget _loginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account?'),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, 'login');
          },
          child: const Text(
            'Login Now',
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
