import 'package:flutter/material.dart';
import 'package:mvvm_app/utils/routes/routes_names.dart';
import 'package:mvvm_app/viewModel/user_view_model.dart';

import '../view/tab_bars.dart';

class SplashService {
  static void checkAuthentication(BuildContext context) async {
    final userViewModel = UserViewModel();

    final user = await userViewModel.getUser();

    if (user!.token.toString() == "null" || user.token.toString() == "") {
      await Future.delayed(const Duration(seconds: 3));
      ///uncomment this line
      // Navigator.pushNamed(context, RouteNames.signupScreen);
      Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => BottomMenuBar()),
              (Route<dynamic> route) => false, // Remove all previous screens
            );
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.pushNamed(context, RouteNames.home);
    }
  }
}
