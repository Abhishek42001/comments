import 'package:comments/constants/api_endpoints.dart';
import 'package:dio/dio.dart';

class NetworkLayer {
  NetworkLayer._() {
    _dioInstance = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints().baseUrl,
        connectTimeout: const Duration(
          seconds: 10,
        ),
      ),
    );

    //// Add logging interceptor
    //// This will log all requests and responses
    _dioInstance.interceptors.add(LogInterceptor());

    ///We can also add other interceptors like
    ///interceptor to add a token to the request
  }

  static final NetworkLayer _instance = NetworkLayer._();
  factory NetworkLayer() => _instance;

  late final Dio _dioInstance;

  Dio get client {
    return _dioInstance;
  }
}
