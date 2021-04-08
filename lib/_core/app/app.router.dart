// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../views/addUser/addUser.dart';
import '../../views/editUser/editUserScreen.dart';
import '../../views/userList/userListScreen.dart';
import '../models/userModel.dart';
class Routes {
static const String userListScreen = '/';
static const String addUserScreen = '/add-user-screen';
static const String editUserScreen = '/edit-user-screen';
static const all = <String>{
userListScreen,addUserScreen,editUserScreen,};}

class StackedRouter extends RouterBase {
     @override
     List<RouteDef> get routes => _routes;
     final _routes = <RouteDef>[
     

RouteDef(Routes.userListScreen
,page: UserListScreen
),
RouteDef(Routes.addUserScreen
,page: AddUserScreen
),
RouteDef(Routes.editUserScreen
,page: EditUserScreen
),
];       @override
       Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
        final _pagesMap = <Type, StackedRouteFactory>{
        

UserListScreen: (data) {
return MaterialPageRoute<dynamic>(builder: (context) => const  UserListScreen(), settings: data,);
},AddUserScreen: (data) {
return MaterialPageRoute<dynamic>(builder: (context) => const  AddUserScreen(), settings: data,);
},EditUserScreen: (data) {
var args = data.getArgs<EditUserScreenArguments>(
orElse: ()=> EditUserScreenArguments(),);return MaterialPageRoute<dynamic>(builder: (context) =>   EditUserScreen(user:args.user), settings: data,);
},};}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// EditUserScreen arguments holder class
class EditUserScreenArguments{
final UserModel user;
EditUserScreenArguments({
this.user});
}
