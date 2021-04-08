class UserModel {
  String address;
  String name;
  String phone;
  UserCategory userCategory;
  int id;

  UserModel({this.address, this.name, this.phone, this.userCategory, this.id});

  UserModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    name = json['name'];
    phone = json['phone'];
    userCategory = json['user_category'] != null
        ? new UserCategory.fromJson(json['user_category'])
        : null;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['name'] = this.name;
    data['phone'] = this.phone;
    if (this.userCategory != null) {
      data['user_category'] = this.userCategory.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class UserCategory {
  String name;

  UserCategory({this.name});

  UserCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}


class UserCategoriesModel {
  String id;
  String name;
  UserCategoriesModel({this.id, this.name});
  UserCategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
