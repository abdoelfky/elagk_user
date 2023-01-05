import 'package:dio/dio.dart';
import 'package:elagk/shared/network/api_constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token ,
  }) async {

    return await dio!.get(
      url,
      queryParameters: query,

    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token ,
  }) async {
    dio!.options.headers ={

      'Content-Type': 'application/json'


    };

    return   dio!.post(
      url,
      queryParameters:query,
      data: data,

    );
  }

  static Future<Response> putData({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    String? token ,
  }) async {
    dio?.options.headers ={
      'Content-Type' :'application/json',

    };

    return  dio!.put(
      url,
      queryParameters:query,
      data: data,
    );
  }


  static Future<Response> putDataFromJson({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String? token ,
  }) async {
    dio?.options.headers ={
      'Content-Type' :'application/json',

    };

    return  dio!.put(
      url,
      queryParameters:query,
      data: data,
    );
  }

  static Future<Response> postDataFromFormData({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    String? token ,
  }) async {
    dio!.options.headers ={

      'Content-Type': 'application/json'


    };

    return   dio!.post(
      url,
      queryParameters:query,
      data: data,

    );
  }
}