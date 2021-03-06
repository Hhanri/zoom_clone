import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:zoom_clone/services/auth_service.dart';
import 'package:zoom_clone/widgets/button_widget.dart';

class LoginPage extends HookWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Start or Join a Meeting",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
        Image.asset('assets/images/onboarding.jpg'),
        ButtonWidget(
          text: "Login",
          onPressed: () async {
            final bool res = await authService.signInWithGoogle(context);
            if (res) {
              //go to home screen
            } else {
              
            }
          },
        )
      ],
    );
  }
}
