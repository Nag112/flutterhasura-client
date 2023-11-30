import 'package:hasurademo/_core/app/app.locator.dart';
import 'package:hasurademo/_core/app/app.router.dart';
import 'package:hasurademo/_core/services/userService.dart';
import 'package:hasurademo/views/pickUserCategory/pickUserCategory.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddUserViewModel extends ReactiveViewModel {
  UserService _user = locator<UserService>();
  NavigationService _nav = locator<NavigationService>();
  String name;
  String get category => _user.pickedUserCategory.value.name;
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

  pickCategory() {
    _nav.navigateToView(PickUserCategoryScreen());
  }

  submit() {
    var data = {
      "name": name,
      "phone": phone,
      "address": address,
      "user_category_id": _user.pickedUserCategory.value.id
    };
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

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_user];
}
