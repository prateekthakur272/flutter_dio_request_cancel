import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dio_request_cancel/src/screens/home_screen/repository/repository.dart';

class HomeProvider extends ChangeNotifier{
  Map<String, dynamic>? _data;
  bool _loading = false;
  CancelToken? _cancelToken;

  final HomeRepository _homeRepository;
  HomeProvider(HomeRepository homeRepository) : _homeRepository = homeRepository;

  Map<String, dynamic>? get data => _data;
  bool get loading => _loading;

  void getData() async {
    _cancelToken = CancelToken();
    _loading = true;
    _data = null;
    notifyListeners();
    try{
      _data = await _homeRepository.fetchData(_cancelToken);
    }catch(e){
      log(e.toString());
    }
    _loading = false;
    notifyListeners();
  }

  void cancelRequest(){
    _cancelToken?.cancel('Cancelled by HomeProvider');
  }
}