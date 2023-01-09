import 'package:flutter/foundation.dart';

import '../services/api_services.dart';

import '../utils/utils.dart';

class HomeRepository {
  final _networkService = NetworkApiService();

  userApicall(context) async {
    try {
      final response = await _networkService
          .getGetApiResponse('https://reqres.in/api/users/')
          .catchError((error, stackTrace) {
        Utils.showMyDialog(error.toString(), context);
        if (kDebugMode) {
          print(error.toString());
        }
      });

      return response;
    } catch (e) {
      throw e;
    }
  }
}
