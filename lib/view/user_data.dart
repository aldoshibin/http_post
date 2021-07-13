import 'package:flutter/material.dart';
import 'package:httppostteach/model/user_model.dart';

class UserDataPage extends StatefulWidget {
  UserDataPage({Key key}) : super(key: key);

  @override
  _UserDataPageState createState() => _UserDataPageState();
}

UserModel _user;

class _UserDataPageState extends State<UserDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: _user == null
              ? Container()
              : Text(
                  "The user ${_user.name}, ${_user.id} is created successfully at time ${_user.createdAt.toIso8601String()}"),
        ),
      ),
    );
  }
}
