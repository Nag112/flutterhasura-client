import 'package:hasurademo/_core/app/app.locator.dart';
import 'package:hasurademo/_core/app/app.router.dart';
import 'package:hasurademo/_core/models/userModel.dart';

import 'package:hasurademo/_core/services/userService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UserListScreenViewModel extends ReactiveViewModel {
  UserService _user = locator<UserService>();
  List<UserModel> get users => _user.list;
  NavigationService _nav = locator<NavigationService>();

  slideButtonAction(action, index) {
    switch (action) {
      case "delete":
        _user.deleteUser(index);
        break;
      case "edit":
        _nav.navigateTo(Routes.editUserScreen,
            arguments: EditUserScreenArguments(user:users[index]));
    }
  }

  addUser() {
    _nav.navigateTo(Routes.addUserScreen);
  }
  refreshUsers()
  {
    
  }

  onReady() async {
    setBusy(true);
    await _user.fetchUsers();
    setBusy(false);
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [_user];
}
