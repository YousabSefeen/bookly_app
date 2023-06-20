import 'package:bookly/core/utils/api_constants.dart';
import 'package:dio/dio.dart';

class ApiServices {


  final Dio _dio;

  ApiServices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    ///final response=await _dio.get(_baseUrl+endPoint);
    final response = await _dio.get('${ApiConstants.baseUrl}$endPoint');

    return response.data;
  }
}
