import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loveshayri/second.dart';
import 'package:loveshayri/shayaricat.dart';

void main() {
  runApp(MaterialApp(
    home: app(),debugShowCheckedModeBanner: false,
  ));
}

class app extends StatefulWidget {

  const app({Key? key}) : super(key: key);

  @override
  State<app> createState() => _appState();
}

class _appState extends State<app> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(margin: EdgeInsets.only(right: 12),
            child: Icon(Icons.share_sharp),
          ),
          Container(
            child: Icon(Icons.more_vert),
          )
        ],
        title: Text("Love shayari"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.grey,
      body: ListView.separated(
        itemBuilder: (context, index) {
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return shayari(index);
                  },
                ));
              },
              child: ListTile(
                tileColor: Colors.white,
                leading: Image.asset(
                  "images/${categary.im[index]}",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                title: Text("${categary.shayari[index]}",
                style: TextStyle(color: Colors.green),
              ),
              ));
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.black,
            height: 10,
          );
        },
        itemCount: categary.shayari.length,
      ),
    );
  }
}
