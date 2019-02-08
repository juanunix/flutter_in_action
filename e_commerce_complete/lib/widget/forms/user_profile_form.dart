/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce_complete/blocs/app_state.dart';
import 'package:e_commerce_complete/blocs/user_bloc.dart';
import 'package:e_commerce_complete/widget/forms/form_field_container.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';

class UserProfileForm extends StatefulWidget {
  @override
  _UserProfileFormState createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _nameController;
  TextEditingController _emailController;
  UserBloc _bloc;
  bool _userInformationHasBeenUpdated = false;
  String _prevName;
  String _prevContact;

  @override
  void didChangeDependencies() async {
    _bloc = AppState.of(context).blocProvider.userBloc;
    var user = await _bloc.user.first.then((u) => u);
    _nameController = new TextEditingController(text: user.name);
    _emailController = new TextEditingController(text: user.contact);
    _prevName = _nameController.text;
    _prevContact = _emailController.text;
    _nameController.addListener(onChange);
    _emailController.addListener(onChange);
    setState(() {});
    super.didChangeDependencies();
  }

  void onChange() {
    if (_prevName == _nameController.text &&
        _prevContact == _emailController.text) return;
    setState(() {
      _userInformationHasBeenUpdated = true;
    });
  }

  FlatButton get submitButton => FlatButton(
        onPressed: _userInformationHasBeenUpdated
            ? () {
                _formKey.currentState.save();
                _bloc.updateUserInformationSink.add(
                  UpdateUserEvent(
                    ECommerceUser(
                        name: _nameController.text,
                        contact: _emailController.text),
                  ),
                );
              }
            : null,
        child: Text("Submit info"),
      );

  @override
  Widget build(BuildContext context) {
    Widget avatar = Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/apple-in-hand.jpg"),
          radius: 60.0,
        ));

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          avatar,
          FormFieldContainer(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name:",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Field cannot be left blank";
                }
              },
              controller: _nameController,
              onSaved: (value) => print(value),
            ),
          ),
          FormFieldContainer(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Contact:",
              ),
              validator: (value) {
                if (!value.contains("@") && !value.contains(".")) {
                  return "Please enter a valid email address.";
                }
              },
              onSaved: (val) => print("cool"),
              autovalidate: false,
              controller: _emailController,
            ),
          ),
          submitButton,
        ],
      ),
    );
  }
}
