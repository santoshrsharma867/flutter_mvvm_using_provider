import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../repository/home_repo.dart';

class Homenotifier extends ChangeNotifier {
  List _userData = [];
  List get userData => _userData;
  final _homeRepo = HomeRepository();

  bool loading = false;

  userApiCall(BuildContext context) async {
    loading = true;
    try {
      final response = await _homeRepo.userApicall(context);
      _userData = response['data'];
      loading = false;
      notifyListeners();
    } catch (e) {
      log('Erroer $e');
    }
  }
}
