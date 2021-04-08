import 'package:flutter/material.dart';
import 'package:hasurademo/views/addUser/addUserViewModel.dart';
import 'package:stacked/stacked.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddUserViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                labelText: "Name",
                onChanged: model.onText,
              ),
              CustomTextField(
                labelText: "Phone",
                onChanged: model.onText,
              ),
              CustomTextField(
                labelText: "Address",
                onChanged: model.onText,
              ),
              InkWell(
                onTap: model.pickCategory,
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(model.category ?? "pick a category")),
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
      viewModelBuilder: () => AddUserViewModel(),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final Function onChanged;
  final String labelText;
  const CustomTextField({
    Key key,
    this.onChanged,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: labelText,
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
        onChanged: (val) => onChanged(labelText.toLowerCase(), val),
      ),
    );
  }
}
