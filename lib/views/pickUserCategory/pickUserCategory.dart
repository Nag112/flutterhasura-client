import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'pickUserCategoryViewModel.dart';

class PickUserCategoryScreen extends StatelessWidget {
  const PickUserCategoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PickUserCategoryViewModel>.reactive(
      onModelReady: (model) => model.onReady(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          child: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: model.categories.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${model.categories[index].name}"),
                      onTap: () => model.selectCategory(index),
                    );
                  }),
        ),
      ),
      viewModelBuilder: () => PickUserCategoryViewModel(),
    );
  }
}
