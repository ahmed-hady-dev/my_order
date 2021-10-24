import 'package:dio/dio.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/core/cacheHelper/cache_helper.dart';

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
      'Authorization': 'Bearer ${CacheHelper.getUserToken}',
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

//===============================================================
  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? lang = 'en',
  }) async {
    dio!.options.headers = {
      "Accept": "application/json",
      'Authorization': 'Bearer ${CacheHelper.getUserToken}',
      'lang': lang,
    };
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  } //===============================================================

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
