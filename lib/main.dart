import 'package:comments/constants/app_colors.dart';
import 'package:comments/constants/app_routes.dart';
import 'package:comments/constants/routes.dart';
import 'package:comments/services/firebase_service.dart';
import 'package:comments/services/remote_config_service.dart';
import 'package:comments/viewModel/auth_view_model.dart';
import 'package:comments/viewModel/comments_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await FirebaseService().initializeApp();
  await FirebaseRemoteConfigService().initialize();
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(),
        ),
        ChangeNotifierProvider<CommentsViewModel>(
          create: (context) => CommentsViewModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Comments',
        theme: ThemeData(
          scaffoldBackgroundColor: bgColor,
          primaryColor: primaryColor,
          useMaterial3: true,
        ),
        routes: routes,
        initialRoute: AppRoutes().signIn,
      ),
    );
  }
}
