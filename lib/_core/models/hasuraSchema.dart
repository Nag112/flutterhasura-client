const String userFetchSchema = """
  query {
    user {
        id
        phone
        name
        address
       user_category{
          name
          id
        }
      }
  }
""";
const String userCategoryFetchSchema = """
  query {
    user_categories {
        id
        name
      }
  }
""";

String addUserSchema(data) => """mutation addUser {
  insert_user(objects: $data) {
    returning {
      id
      name
      phone
      user_category{
          name
          id
        }
    }
  }
}""";

String deleteUserSchema(data) => """mutation MyQuery {
   delete_user(where: {id:{_eq:$data}}) {
    returning {
      name
    }
  }
}""";

String editUserSchema(id, data) => """mutation MyQuery {
   update_user(where: {id:{_eq:$id}}},_set:$data) {
    returning {
      name
      id
      address
       user_category{
          name
        }
    }
  }
}""";
