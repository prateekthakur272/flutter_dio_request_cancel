import 'package:dio/dio.dart';
import 'package:flutter_dio_request_cancel/src/core/api_client.dart';

abstract class BaseHomeRepository{
  Future<Map<String, dynamic>> fetchData(CancelToken cancelToken);
  void cancelRequest(CancelToken cancelToken);
}

class HomeRepository extends BaseHomeRepository{

  final _apiClient = ApiClient();

  @override
  void cancelRequest(CancelToken cancelToken) {
    _apiClient.cancelRequest(cancelToken, 'Request Cancelled');
  }

  @override
  Future<Map<String, dynamic>> fetchData(CancelToken? cancelToken) async {
    return await _apiClient.getData(cancelToken);
  }
}