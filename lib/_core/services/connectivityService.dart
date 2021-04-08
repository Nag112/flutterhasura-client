import 'package:connectivity/connectivity.dart';
import 'package:hasurademo/_core/app/app.locator.dart';
import 'package:hasurademo/_core/services/utilsService.dart';

enum SnackbarType { greenAndRed, redAndWhite }

class ConnectivityService {
  UtilsService _utils = locator<UtilsService>();
  Connectivity _connect = new Connectivity();
  Future<ConnectivityResult> get status => _connect.checkConnectivity();
  ConnectivityService() {
    _connect.checkConnectivity().then((res) {
      if (res == ConnectivityResult.none) {
        _utils.showErrorSnackBar(
            msg: 'Please connect to Internet for better experience',
            title: "No Internet");
      }
    }).catchError((e) {
      print("error from check connection ${e.toString()}");
    });
    _connect.onConnectivityChanged.listen((res) async {
      if (ConnectivityResult.none == res) {
        _connect.checkConnectivity().then((res) {
          if (res == ConnectivityResult.none) {
            _utils.showSnackBar(
                title: "No internet",
                msg: "Please connect to Internet for better experience");
          }
        });
      }
    });
  }
}
