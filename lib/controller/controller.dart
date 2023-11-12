import 'package:extracting_data_from_the_internet/model/user_model.dart';
import 'package:extracting_data_from_the_internet/service/service.dart';
import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  bool? isLoading;
  List<UserModelData> users = [];

  void getData() {
    Service.fetch().then((value) {
      if (value != null) {
        users = value.data!;
        isLoading = true;
      } else {
        isLoading = false;
      }
    });

    notifyListeners();
  }
}
