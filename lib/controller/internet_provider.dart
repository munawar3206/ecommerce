// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:modernlogintute/services/internet_service.dart';



// class InternetProvider extends ChangeNotifier {
//   final InternetService _internetService = InternetService();
//   bool _isConnected = false;
//   String _error = '';

//   bool get isConnected => _isConnected;
//   String get error => _error;

//   Future<void> checkInternetConnectivity() async {
//     try {
//       bool isConnected = await _internetService.checkInternetConnectivity();
//       if (isConnected != _isConnected) {
//         _isConnected = isConnected;
//         notifyListeners();
//       }
//     } on SocketException {
//       _error = 'No internet connection';
//       notifyListeners();
//     } on InternetCheckException catch (e) {
//       _error = e.message;
//       notifyListeners();
//     }
//   }
// }
import 'dart:async';

import 'package:ecommerce/model/internetservice_widget.dart';
import 'package:flutter/material.dart';



class InternetConnectivityProvider extends ChangeNotifier {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  final InternetConnectivityServices _connectivityServices =
      InternetConnectivityServices();

  Future getInternetConnectivity(BuildContext context) async {
    _connectivityServices.getConnectivity(context); 
     isDeviceConnected=_connectivityServices .isDeviceConnected;
     isAlertSet=_connectivityServices.isAlertSet;
     subscription=_connectivityServices.subscription;
     
    
  }
  notifyListeners();
}

