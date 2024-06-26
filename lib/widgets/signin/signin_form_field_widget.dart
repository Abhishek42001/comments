import 'package:comments/utils/validations.dart';
import 'package:comments/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SigninFormFieldsWidget extends StatelessWidget {
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  const SigninFormFieldsWidget({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppTextField(
              hintText: 'Email',
              validator: (value) {
                return Validations.isEmailValid(value ?? "")
                    ? null
                    : 'Please Enter valid email';
              },
              controller: _emailController,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: AppTextField(
                hintText: 'Password',
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  return Validations.isPasswordValid(value ?? "")
                      ? null
                      : 'Please Enter valid password';
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
