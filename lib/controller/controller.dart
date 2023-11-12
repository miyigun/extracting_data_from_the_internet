import 'package:extracting_data_from_the_internet/model/user_model.dart';
import 'package:extracting_data_from_the_internet/service/service.dart';
import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  bool? isLoading;

  PageController pageController=PageController(initialPage: 0);

  List<UserModelData?> users = [];
  List<UserModelData?> saved=[];

  void getData() {
    Service.fetch().then((value) {
      if (value != null) {
        users = value.data!;
        isLoading = true;

        notifyListeners();
      } else {
        isLoading = false;

        notifyListeners();
      }
    });
  }

  void addSaved(UserModelData model){
    saved.add(model);
    users.remove(model);

    notifyListeners();
  }
}
