import 'dart:convert';

import 'package:flutter/material.dart';

String jsonData = '''

              {
             "user":[
              {"id":"1", "name":"Ali", "email":"ali@gmail.com"},
              {"id":"2", "name":"ahmad", "email":"ahmad@gmail.com"},
              {"id":"3", "name":"Jasim", "email":"Jasim@gmail.com"}
             ]
              }

''';

void main(List<String> args) {
  // print(jsonData.runtimeType);
  final parsedResponse = jsonDecode(jsonData);
  print(parsedResponse);

  List<dynamic> userList = parsedResponse['user'];
  print(userList.runtimeType);
  List<User> myUsers = userList.map((json) => User.fromJson(json)).toList();
  print(myUsers.runtimeType);
  for (var user in myUsers) {
    print(user.name);
  }
  // print(myUsers[0].name);

  '''

List<User> muUser = getMyUser(jsonData)
build()....{}

final user = myUser[indix];
ListTile(title: Text(user.id))

''';
}

class User {
  final String id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], email: json['email']);
  }

  Map<String, dynamic> toJson() {
    return {id: 'id', name: 'name', email: 'email'};
  }
}

class ShowUsersData extends StatefulWidget {
  const ShowUsersData({super.key});

  @override
  State<ShowUsersData> createState() => _ShowUsersDataState();
}

class _ShowUsersDataState extends State<ShowUsersData> {
  late List<User> myUsers;
  @override
  void initState() {
    final parsedResponse = jsonDecode(jsonData);
    List<dynamic> userList = parsedResponse['user'];
    myUsers = userList.map((json) => User.fromJson(json)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: myUsers.length,
        itemBuilder: (context, index) {
          final user = myUsers[index];
          return ListTile(
            leading: Text(user.id),
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
    );
  }
}
