class AppRoutes{
  AppRoutes._();
  static final AppRoutes _instance = AppRoutes._();
  factory AppRoutes()=>_instance;

  String signIn = '/signIn';
  String signUp = '/signUp';
  String comment = '/comment';
}