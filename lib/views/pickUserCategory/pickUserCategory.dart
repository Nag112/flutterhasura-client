import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'pickUserCategoryViewModel.dart';

class PickUserCategoryScreen extends StatelessWidget {
  const PickUserCategoryScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PickUserCategoryViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => PickUserCategoryViewModel(),
    );
  }
}
