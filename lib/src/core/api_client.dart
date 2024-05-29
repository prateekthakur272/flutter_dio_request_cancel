import 'package:dio/dio.dart';
import 'package:flutter_dio_request_cancel/src/config/env.dart';

abstract class BaseApiClient{
  Future<Map<String, dynamic>> getData(CancelToken cancelToken);
  void cancelRequest(CancelToken cancelToken, String? reason);
}

class ApiClient extends BaseApiClient{

  final Dio _dio = Dio();

  @override
  void cancelRequest(CancelToken cancelToken, String? reason) {
    cancelToken.cancel(reason??'Cancelling Request');
  }

  @override
  Future<Map<String, dynamic>> getData(CancelToken? cancelToken) async {
    final res = await _dio.get(Env.baseUrl, cancelToken: cancelToken);
    return res.data;
  }
}