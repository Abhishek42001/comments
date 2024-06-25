import 'package:comments/constants/app_routes.dart';
import 'package:comments/view/comments_screen.dart';
import 'package:comments/view/sign_in_screen.dart';
import 'package:comments/view/sign_up_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes ={ 
  AppRoutes().signIn:(context) => const SignInScreen(),
  AppRoutes().signUp:(context)=>const SignUpScreen(),
  AppRoutes().comment:(context)=> const CommentsScreen(),
};