import 'package:flutter/material.dart';
import 'package:httppostteach/model/user_model.dart';
import 'package:httppostteach/services/api_manager.dart';
import 'package:httppostteach/view/user_data.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel _user;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Test'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: jobController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your job title',
                  ),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              _user == null
                  ? Container()
                  : Text(
                      "The user ${_user.name}, ${_user.id} is created successfully at time ${_user.createdAt.toIso8601String()}"),
              SizedBox(
                height: 32,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final String name = nameController.text;
                    final String jobTitle = jobController.text;

                    final UserModel user =
                        await Api_Manager().createUser(name, jobTitle);

                    setState(() {
                      _user = user;
                      nameController.clear();
                      jobController.clear();
                    });
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (c) => UserDataPage(),
                    //   ),
                    // );
                  },
                  child: Text('submit'))
            ],
          ),
        ),
      ),
    );
  }
}
