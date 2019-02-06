/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:io';

import 'package:e_commerce_complete/blocs/app_state.dart';
import 'package:e_commerce_complete/blocs/catalog_bloc.dart';
import 'package:e_commerce_complete/blocs/user_bloc.dart';
import 'package:e_commerce_complete/utils/styles.dart';
import 'package:e_commerce_complete/widget/forms/form_field_container.dart';
import 'package:e_commerce_complete/widget/form_header.dart';
import 'package:flutter/material.dart';
import 'package:shared_lib/e_commerce_app.dart';
import 'package:image_picker/image_picker.dart';

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  NewProduct _newProduct = new NewProduct();
  File _selected;

  BoxDecoration get _image {
    return _selected == null
        ? BoxDecoration(color: Colors.grey[300])
        : BoxDecoration(
            image:
                DecorationImage(image: FileImage(_selected), fit: BoxFit.cover),
          );
  }

  @override
  Widget build(BuildContext context) {
    var _bloc = AppState.of(context).blocProvider.catalogBloc;
    var _userBloc = AppState.of(context).blocProvider.userBloc;
    return Container(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormHeader(title: "New Product"),
              FormFieldContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    helperText: "Required",
                    labelText: "Title",
                  ),
                  autofocus: true,
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "Field cannot be left blank";
                    }
                  },
                  onSaved: (String val) => _newProduct.title = val,
                ),
              ),
              FormFieldContainer(
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Cost Per Unit",
                    helperText: "Required",
                  ),
                  keyboardType: TextInputType.numberWithOptions(),
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "Field cannot be left blank";
                    }
                    if (double.tryParse(val) == null) {
                      return "Field must contain a valid number.";
                    }
                  },
                  onSaved: (String val) =>
                      _newProduct.cost = double.tryParse(val),
                ),
              ),
              FormFieldContainer(
                child: DropdownButtonFormField<ProductCategory>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Category",
                  ),
                  value: _newProduct.category,
                  onChanged: (ProductCategory newSelection) {
                    setState(() => _newProduct.category = newSelection);
                  },
                  items: ProductCategory.values.map((ProductCategory category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category.toString()));
                  }).toList(),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 150.0,
                    ),
                    child: Container(
                      decoration: _image,
                    ),
                  ),
                  _selected == null ? Text("Select an image") : Container(),
                  Positioned(
                    right: 8.0,
                    bottom: 8.0,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primary[500],
                      foregroundColor: Colors.grey[300],
                      child: Icon(Icons.photo_library),
                      onPressed: () async {
                        File image = await ImagePicker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          _selected = image;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Divider(
                height: 32.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      textColor: Colors.red[400],
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      color: Colors.blue[400],
                      child: Text("Submit"),
                      onPressed: () {
                        _formKey.currentState.save();
                        _bloc.addNewProduct.add(AddProductEvent(_newProduct));
                        _userBloc.addNewProductToUserProductsSink
                            .add(NewUserProductEvent(_newProduct));
                        Navigator.of(context).pop();
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
