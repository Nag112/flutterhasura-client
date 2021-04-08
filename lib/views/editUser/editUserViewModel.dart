import 'package:hasurademo/_core/app/app.locator.dart';
import 'package:hasurademo/_core/app/app.router.dart';
import 'package:hasurademo/_core/models/userModel.dart';
import 'package:hasurademo/_core/services/userService.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditUserViewModel extends BaseViewModel {
  UserService _userService = locator<UserService>();
  NavigationService _nav = locator<NavigationService>();
  UserModel _user;
  UserModel get user => _user;
  onText(type, val) {
    switch (type) {
      case "name":
        user.name = val;
        break;
      case "phone":
        user.phone = val;
        break;
      case "address":
        user.address = val;
        break;
      default:
    }
  }

  onEditReady(user) {
    setBusy(true);
    _user = user;
    setBusy(false);
  }

  submit() {
    var data = user.toJson();
    if (data.values.contains(null)) {
      print("invalid data");
    } else {
      _userService.editUser(data).then((ele) {
        _nav.clearStackAndShow(Routes.userListScreen);
      }).catchError((e) {
        print(e);
      });
    }
  }
}
