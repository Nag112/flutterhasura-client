import 'package:hasurademo/_core/app/app.locator.dart';
import 'package:hasurademo/_core/models/hasuraSchema.dart';
import 'package:hasurademo/_core/models/userModel.dart';
import 'package:observable_ish/list/list.dart';
import 'package:hasurademo/_core/services/hasuraService.dart';
import 'package:observable_ish/observable_ish.dart';
import 'package:stacked/stacked.dart';

class UserService with ReactiveServiceMixin {
  HasuraService _hasuraService = locator<HasuraService>();
  RxList<UserModel> _users = RxList();
  RxValue<UserCategoriesModel> pickedUserCategory =
      RxValue<UserCategoriesModel>(UserCategoriesModel());
  UserService() {
    listenToReactiveValues([_users, pickedUserCategory]);
  }
  List<UserModel> get list => _users;
  resetPickedCategory() {
    pickedUserCategory.value = UserCategoriesModel();
  }

  pickUserCategory(UserCategoriesModel val) {
    pickedUserCategory.value = val;
    notifyListeners();
  }

  Future deleteUser(index) async {
    try {
      _hasuraService.mutation(deleteUserSchema(_users[index].id));
      _users.removeAt(index);
      notifyListeners();
    } catch (e) {
      print("error on delete $e");
    }
  }

  Future addUsers(data) async {
    resetPickedCategory();
    data = _hasuraService.serialize(Map.from(data));
    try {
      var resp = await _hasuraService.mutation(addUserSchema(data));
      return resp['data'];
    } catch (e) {}
  }

  Future editUser(Map user) async {
    try {
      var resp = await _hasuraService
          .mutation(editUserSchema(user['id'], _hasuraService.serialize(user)));
      return resp['data'];
    } catch (e) {
      print("error on update $e");
    }
  }

  Future fetchCategories() async {
    try {
      var resp = await _hasuraService.query(userCategoryFetchSchema);
      return List.from(resp['data']['user_categories'])
          .map((ele) => UserCategoriesModel.fromJson(ele))
          .toList();
    } catch (e) {
      print(e);
    }
  }

  Future fetchUsers() async {
    try {
      var resp = await _hasuraService.query(userFetchSchema);
      _users.clear();
      var _temp = List.from(resp['data']['user'])
          .map((ele) => UserModel.fromJson(ele))
          .toList();
      _users.addAll(_temp);
    } catch (e) {
      print(e);
    }
  }
}
