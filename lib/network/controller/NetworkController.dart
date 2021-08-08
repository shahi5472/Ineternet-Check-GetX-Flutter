import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var connectionStatus = ''.obs;
  final Connectivity _connectivity = Connectivity();

  StreamSubscription<ConnectivityResult>? _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    initConnectivity();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.message);
    }
    return _updateConnectionStatus(result!);
  }

  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 'Wifi Connected';
        break;
      case ConnectivityResult.mobile:
        connectionStatus.value = 'Mobile data connected';
        break;
      case ConnectivityResult.none:
        connectionStatus.value = 'No internet connection';
        break;
      default:
        connectionStatus.value = 'Check your internet connection';
        Get.snackbar('Network error', 'Check your internet connection');
        break;
    }
  }
}
