import 'package:hasurademo/_core/models/userModel.dart';
import 'package:stacked/stacked.dart';

class PickUserCategoryViewModel extends BaseViewModel {
  List<UserCategoriesModel> _categories = [];
  List<UserCategoriesModel> get categories => _categories;
}
