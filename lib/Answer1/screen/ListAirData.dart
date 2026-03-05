/*import 'dart:convert';

import 'package:first_project/model/AirData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListUserScreenV2 extends StatefulWidget {
  const ListUserScreenV2({super.key});

  @override
  State<ListUserScreenV2> createState() => _ListUserScreenV2State();
}

class_ListAirDataState extends {
  List<dynamic> listUser = [];
  List<AirData> listAirData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  void getUser() async {
    setState(() {
      listUserV2 = [];
    });
    try {
      var response = await http.get(Uri.parse('https://dummyjson.com/user'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<dynamic> jsonList = data['users'];
        setState(() {
          listUserV2 = jsonList.map((item) => User.fromJson(item)).toList();
        });
      }
    } catch (e) {
      print('Error : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call API'),
      ),
      body: ListView.separated(
        itemCount: listUserV2.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text('ID ${listUserV2[index].id}'),
            title: Text(listUserV2[index].fullName),
            subtitle: Text(listUserV2[index].email),
          );
        },
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            getUser();
          },
          child: Text('refresh')),
    );
  }
}*/
