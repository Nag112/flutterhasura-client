import 'package:flutter/material.dart';
import 'package:hasurademo/_core/models/userModel.dart';
import 'package:stacked/stacked.dart';

import 'editUserViewModel.dart';

class EditUserScreen extends StatelessWidget {
  final UserModel user;
  const EditUserScreen({this.user});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditUserViewModel>.reactive(
      onModelReady: (model) => model.onEditReady(user),
      builder: (context, model, child) => Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                labelText: "Name",
                initVal: model.user.name,
                onChanged: model.onText,
              ),
              CustomTextField(
                labelText: "Phone",
                initVal: model.user.phone,
                onChanged: model.onText,
              ),
              CustomTextField(
                labelText: "Address",
                initVal: model.user.address,
                onChanged: model.onText,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: model.submit, child: Text("Submit")))
            ],
          ),
        ),
      ),
      viewModelBuilder: () => EditUserViewModel(),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final Function onChanged;
  final String labelText;
  final String initVal;
  const CustomTextField({
    Key key,
    this.onChanged,
    this.labelText,
    this.initVal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        initialValue: initVal,
        decoration: InputDecoration(
            labelText: labelText,
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
        onChanged: (val) => onChanged(labelText.toLowerCase(), val),
      ),
    );
  }
}
