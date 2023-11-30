import 'package:hasurademo/_core/app/app.locator.dart';
import 'package:hasurademo/_core/models/userModel.dart';
import 'package:hasurademo/_core/services/userService.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PickUserCategoryViewModel extends BaseViewModel {
  List<UserCategoriesModel> _categories = [];
  List<UserCategoriesModel> get categories => _categories;
  UserService _user = locator<UserService>();
  NavigationService _nav = locator<NavigationService>();

  selectCategory(index) {
    _user.pickUserCategory(categories[index]);
    _nav.back();
  }

  onReady() async {
    setBusy(true);
    _categories = await _user.fetchCategories();
    setBusy(false);
  }
}
