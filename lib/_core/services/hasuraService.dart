//import

import 'package:hasura_connect/hasura_connect.dart';

class HasuraService {
  static String _url = 'https://demoflutter.hasura.app/v1/graphql';
  HasuraConnect _hasuraConnect = HasuraConnect(_url, headers: {
    "x-hasura-access-key":
        "HASURA_ACCESS_KEY"
  });

  query(document) {
    return _hasuraConnect.query(document);
  }

  mutation(document) {
    return _hasuraConnect.mutation(document);
  }

  Future<Snapshot<dynamic>> subscription(document) {
    return _hasuraConnect.subscription(document);
  }

  String serialize(Map data) {
    String ret = "";
    data.forEach((key, value) {
      if (value.runtimeType == String) {
        ret += '$key:"$value",';
      } else {
        ret += '$key:$value,';
      }
    });
    return "{$ret}";
  }
}
