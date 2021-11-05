import 'package:dio/dio.dart';
import '../../constants/constants.dart';
import '../cacheHelper/cache_helper.dart';

class DioHelper {
  static Dio? dio;
  static const String baseUrl = base;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }

//===============================================================
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

//===============================================================
  static Future<Response> getDataByToken({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9sb2NhbGhvc3Q6ODAwMFwvYXBpXC9jbGllbnRcL2F1dGhcL3NpZ25VcCIsImlhdCI6MTYzMzgwNTgyMCwibmJmIjoxNjMzODA1ODIwLCJqdGkiOiI3bEI2T0NGVWs1V0hSN0RNIiwic3ViIjoxLCJwcnYiOiI0MWVmYjdiYWQ3ZjZmNjMyZTI0MDViZDNhNzkzYjhhNmJkZWM2Nzc3In0.RM3Q_czSpwqPFzBpVIrscz4msqQecUOfqJ2p1Smy-KI',
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

//===============================================================
  static Future<Response> postData({
    required String url,
    required dynamic data,
    // required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
      'Authorization': 'Bearer ${CacheHelper.getUserToken}',
    };
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
//===============================================================

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
    };
    return dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
