import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import './login_repository.dart';
import './login_api.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mobileController = TextEditingController();
  final otpController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    mobileController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  final LoginRepository userTripRepo =
      LoginRepository(homeNetworkService: Modular.get<LoginAPI>());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Shankara")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(children: [
            Container(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your username',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: mobileController,
              ),
            ),
            Container(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your OTP',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                controller: otpController,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  userTripRepo.verifyOTP(
                      mobile: mobileController.text, otp: otpController.text);
                },
                child: Text('Login'),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
