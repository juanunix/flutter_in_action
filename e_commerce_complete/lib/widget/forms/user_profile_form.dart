/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce_complete/widget/forms/form_field_container.dart';
import 'package:flutter/material.dart';

class UserProfileForm extends StatefulWidget {
  @override
  _UserProfileFormState createState() => _UserProfileFormState();
}

class _UserProfileFormState extends State<UserProfileForm> {
  String currentUser = "Eric Windmill";
  String userContactAddress = "eric@ericwindmill.com";
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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
                labelText: "Contact:",
              ),
              initialValue: "Eric Windmill",
              validator: (value) {
                if (value.isEmpty) {
                  return "Field cannot be left blank";
                }
              },
              onSaved: (value) => print(value),
            ),
          ),
          FormFieldContainer(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Contact:",
              ),
              initialValue: "eric@ericwindmill.com",
              validator: (value) {
                if (!value.contains("@")) {
                  return "Please enter a valid email address.";
                }
              },
              onSaved: (value) => print(value),
            ),
          ),
        ],
      ),
    );
  }
}
