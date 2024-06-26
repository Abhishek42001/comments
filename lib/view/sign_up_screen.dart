import 'package:comments/config/widget_config.dart';
import 'package:comments/constants/app_colors.dart';
import 'package:comments/constants/app_routes.dart';
import 'package:comments/constants/app_text_style.dart';
import 'package:comments/models/sign_up_model.dart';
import 'package:comments/viewModel/auth_view_model.dart';
import 'package:comments/widgets/app_button.dart';
import 'package:comments/widgets/signup/signup_form_fields_widget.dart';
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

  Future<void> handleSignupTap(AuthViewModel authViewModel) async {
    final bool isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      FocusScope.of(context).unfocus();
      SignUpModel signUpModel = SignUpModel(
        email: _emailController.text,
        password: _passwordController.text,
        name: _nameController.text,
      );
      bool isSuccess = await authViewModel.signUp(signUpModel);
      if (isSuccess) {
        if (mounted) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes().comment,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
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
                  child: Container(
                    margin: const EdgeInsets.only(top: 150),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SignUpFormFieldsWidget(
                            nameController: _nameController,
                            emailController: _emailController,
                            passwordController: _passwordController,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 80)
                                .copyWith(top: 20),
                            child: AppButton(
                              'Signup',
                              isLoading: authViewModel.isLoading,
                              onTap: () => handleSignupTap(authViewModel),
                            ),
                          ),

                          ///We can also create a common
                          ///widget for the button and text below
                          ///button for signin and signup screen
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
