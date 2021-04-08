import 'package:hasurademo/_core/app/app.locator.dart';
import 'package:hasurademo/_core/app/app.router.dart';
import 'package:hasurademo/_core/services/userService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddUserViewModel extends BaseViewModel {
  UserService _user = locator<UserService>();
  NavigationService _nav = locator<NavigationService>();
  String name;
  String phone;
  String address;
  onText(type, val) {
    switch (type) {
      case "name":
        name = val;
        break;
      case "phone":
        phone = val;
        break;
      case "address":
        address = val;
        break;
      default:
    }
  }

  submit() {
    var data = {"name": name, "phone": phone, "address": address};
    if (data.values.contains(null)) {
      print("invalid data");
    } else {
      _user.addUsers(data).then((ele) {
        print(ele);
        _nav.clearStackAndShow(Routes.userListScreen);
      }).catchError((e) {
        print(e);
      });
    }
  }
}
