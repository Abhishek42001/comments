class ApiEndpoints {
  ApiEndpoints._();
  static final ApiEndpoints _instance = ApiEndpoints._();
  factory ApiEndpoints() => _instance;

  String baseUrl = 'https://jsonplaceholder.typicode.com';
  
  String comment = '/comments';

  ///For swim testing
  final String testing = 'testing';
}
