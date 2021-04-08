import 'package:hasurademo/_core/app/app.locator.dart';
import 'package:hasurademo/_core/models/hasuraSchema.dart';
import 'package:hasurademo/_core/models/userModel.dart';
import 'package:observable_ish/list/list.dart';
import 'package:hasurademo/_core/services/hasuraService.dart';
import 'package:stacked/stacked.dart';

class UserService with ReactiveServiceMixin {
  HasuraService _hasuraService = locator<HasuraService>();
  RxList<UserModel> _users = RxList();
  UserService() {
    listenToReactiveValues([_users]);
    fetchCategories();
  }
  List<UserModel> get list => _users;

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
      resp.listen((event) {
        return List.from(event['data']['user_categories'])
            .map((ele) => UserCategoriesModel.fromJson(ele))
            .toList();
      });
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
