import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("JSON data are Display"),
      ),
      body: new Container(
        padding: const EdgeInsets.all( 20.0),
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("load_json/person.json"),
            builder: (context, snapshot) {
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text(" Id is :" + mydata[index]['id']),
                        new Text(" Name is :" + mydata[index]['name']),
                        new Text(" Address is :" + mydata[index]['address']),
                        new Text(" Email is :" + mydata[index]['Email']),
                        new Text(" Age is :" + mydata[index]['age']),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null ? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
