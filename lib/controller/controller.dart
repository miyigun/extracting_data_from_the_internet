import 'package:extracting_data_from_the_internet/model/user_model.dart';
import 'package:extracting_data_from_the_internet/service/service.dart';
import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  bool? isLoading;

  PageController pageController = PageController(initialPage: 0);

  String profileName='Murat';
  List<UserModelData?> users = [];
  List<UserModelData?> saved = [];

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

  void addSaved(UserModelData model) {
    saved.add(model);
    users.remove(model);

    notifyListeners();
  }

  void deleteSaved(UserModelData model){
    saved.remove(model);
    users.add(model);

    notifyListeners();
  }

  profileButton() {
    pageController.animateToPage(0,
        duration: const Duration(microseconds: 500), curve: Curves.bounceInOut);

    notifyListeners();
  }

  notSavedButton() {
    pageController.animateToPage(1,
        duration: const Duration(microseconds: 500), curve: Curves.bounceInOut);

    notifyListeners();
  }

  savedButton() {
    pageController.animateToPage(2,
        duration: const Duration(microseconds: 500), curve: Curves.bounceInOut);

    notifyListeners();
  }
}
