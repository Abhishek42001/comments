import 'package:comments/utils/validations.dart';
import 'package:comments/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class SignUpFormFieldsWidget extends StatelessWidget {
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  const SignUpFormFieldsWidget({
    super.key,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _nameController = nameController,
        _emailController = emailController,
        _passwordController = passwordController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppTextField(
              hintText: 'Name',
              controller: _nameController,
              validator: (value) {
                return Validations.isNameValid(value ?? "")
                    ? null
                    : 'Please Enter valid Name';
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: AppTextField(
                hintText: 'Email',
                controller: _emailController,
                validator: (value) {
                  return Validations.isEmailValid(value ?? "")
                      ? null
                      : 'Please Enter valid email';
                },
              ),
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
