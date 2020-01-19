import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class API extends StatefulWidget {
  @override
  _APIState createState() => _APIState();
}

class _APIState extends State<API> {
  List users;
  Map userData;
  Future setUsers() async {
    String url = "https://pixabay.com/api/?key=14001068-da63091f2a2cb98e1d7cc1d82&q=beautiful&image_type=photo&pretty=true";
    http.Response response = await http.get(url);
    debugPrint(response.body);
    userData = json.decode(response.body);
    setState(() {
      users = userData['hits'];
    });
  }

  void initState() {
    super.initState();
    setUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Homework"),
      ),
      body: ListView.builder(
          itemCount: users == null ? 0 : users.length,
          itemBuilder: (BuildContext context, int i) {
            return Card(
                child: Column(
              children: <Widget>[
                  Row(
              children: <Widget>[
                Container(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("${users[i]['userImageURL']}"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text("${users[i]['user']}"),
                )
              ],
            ),
            Padding(
               padding: const EdgeInsets.all(12.0),
               child: Image.network(users[i]['largeImageURL'],
               fit: BoxFit.cover,
               height: 400.0,
               width: 400.0,
               ),
               ),
              ],
            ));
          }),
    );
  }
}
