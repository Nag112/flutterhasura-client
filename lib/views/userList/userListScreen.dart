import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stacked/stacked.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'userListViewModel.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserListScreenViewModel>.reactive(
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListView.builder(
                      itemCount: model.users.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Slidable(
                            actionPane: SlidableDrawerActionPane(),
                            actionExtentRatio: 0.25,
                            child: Container(
                              color: Colors.white,
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.indigoAccent,
                                  child: Text('$index'),
                                  foregroundColor: Colors.white,
                                ),
                                title: Text(
                                    'Name: ${model.users[index].name} , Category: ${model.users[index].userCategory.name}'),
                                subtitle: Text(
                                    '${model.users[index].phone}, ${model.users[index].address}'),
                              ),
                            ),
                            secondaryActions: <Widget>[
                              IconSlideAction(
                                caption: 'Edit',
                                color: Colors.black45,
                                icon: Icons.edit,
                                onTap: () =>
                                    model.slideButtonAction('edit', index),
                              ),
                              IconSlideAction(
                                caption: 'Delete',
                                color: Colors.red,
                                icon: Icons.delete,
                                onTap: () =>
                                    model.slideButtonAction('delete', index),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: model.addUser,
        ),
      ),
      viewModelBuilder: () => UserListScreenViewModel(),
    );
  }
}
