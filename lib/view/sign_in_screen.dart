import 'package:comments/config/widget_config.dart';
import 'package:comments/constants/app_colors.dart';
import 'package:comments/constants/app_routes.dart';
import 'package:comments/constants/app_text_style.dart';
import 'package:comments/models/sign_in_model.dart';
import 'package:comments/viewModel/auth_view_model.dart';
import 'package:comments/widgets/app_button.dart';
import 'package:comments/widgets/signin/signin_form_field_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> handleSignInTap(AuthViewModel authViewModel) async {
    final bool isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      SignInModel signInModel = SignInModel(
        email: _emailController.text,
        password: _passwordController.text,
      );
      bool isSuccess = await authViewModel.signIn(signInModel);
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
                        SigninFormFieldsWidget(
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 80)
                              .copyWith(top: 20),
                          child: AppButton(
                            'Login',
                            isLoading: authViewModel.isLoading,
                            onTap: () => handleSignInTap(authViewModel),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 13, bottom: 50),
                          child: RichText(
                            text: TextSpan(
                              text: 'New here? ',
                              style: AppTextStyles.txtStyle_16_400,
                              children: [
                                TextSpan(
                                  text: ' Signup',
                                  style: AppTextStyles.txtStyle_16_700.copyWith(
                                    color: primaryColor,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacementNamed(
                                        context,
                                        AppRoutes().signUp,
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
    );
  }
}
