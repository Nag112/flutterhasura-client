import 'package:hasurademo/views/addUser/addUser.dart';
import 'package:hasurademo/views/editUser/editUserScreen.dart';
import 'package:hasurademo/views/userList/userListScreen.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hasurademo/_core/services/hasuraService.dart';
import 'package:hasurademo/_core/services/connectivityService.dart';
import 'package:hasurademo/_core/services/userService.dart';
import 'package:hasurademo/_core/services/utilsService.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: UserListScreen, initial: true),
    MaterialRoute(page: AddUserScreen),
    MaterialRoute(page: EditUserScreen)
  ],
  dependencies: [
    Singleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    Singleton(classType: SnackbarService),
    LazySingleton(classType: UtilsService),
    Singleton(classType: ConnectivityService),
    Singleton(classType: HasuraService),
    LazySingleton(classType: UserService)
  ],
)
class AppSetup {}
