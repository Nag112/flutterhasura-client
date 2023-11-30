// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/connectivityService.dart';
import '../services/hasuraService.dart';
import '../services/userService.dart';
import '../services/utilsService.dart';

final locator = StackedLocator.instance;

void setupLocator() {
  locator.registerSingleton(DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerSingleton(SnackbarService());
  locator.registerLazySingleton(() => UtilsService());
  locator.registerSingleton(ConnectivityService());
  locator.registerSingleton(HasuraService());
  locator.registerLazySingleton(() => UserService());
}
