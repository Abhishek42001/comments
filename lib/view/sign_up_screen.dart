import 'package:comments/config/widget_config.dart';
import 'package:comments/constants/app_colors.dart';
import 'package:comments/constants/app_routes.dart';
import 'package:comments/constants/app_text_style.dart';
import 'package:comments/models/sign_up_model.dart';
import 'package:comments/utils/validations.dart';
import 'package:comments/viewModel/auth_view_model.dart';
import 'package:comments/widgets/app_button.dart';
import 'package:comments/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    AuthViewModel authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: WidgetConfig().pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  "Comments",
                  style: AppTextStyles.txtStyle_20_700.copyWith(
                    color: primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.only(top: height / 7),
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
                          SizedBox(
                            height: height / 2.5,
                          ),
                          SizedBox(
                            width: 231,
                            child: AppButton(
                              'Signup',
                              isLoading: authViewModel.isLoading,
                              onTap: () async {
                                SignUpModel signUpModel = SignUpModel(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  name: _nameController.text,
                                );
                                bool isSuccess =
                                    await authViewModel.signUp(signUpModel);
                                if (isSuccess) {
                                  if (mounted) {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      AppRoutes().comment,
                                    );
                                  }
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 13, bottom: 50),
                            child: RichText(
                              text: TextSpan(
                                text: 'Already have an account?',
                                style: AppTextStyles.txtStyle_16_400,
                                children: [
                                  TextSpan(
                                    text: ' Login',
                                    style:
                                        AppTextStyles.txtStyle_16_700.copyWith(
                                      color: primaryColor,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          AppRoutes().signIn,
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
