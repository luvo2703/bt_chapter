//Drawer
import 'package:flutter/material.dart';

class Exercise8_5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
        //backgroundColor: Colors.blue, // đặt màu cho background là blue
        elevation: 5.0, // để tạo độ nổi
      ),
      body: Center(
        child: Material(
          color: Colors.transparent,
          //shadowColor: Colors.red, //  đặt màu bóng cho Material là đỏ
          child: Text(
            'Hello Dart!',
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
      drawer: Drawer(
        child: Material(
          //color: Colors.green, // được sử dụng để đặt màu nền cho Drawer
          shape: RoundedRectangleBorder( //
            borderRadius: BorderRadius.circular(10.0),// bo góc và đặt bán kính là 10.0
          ),

          child: ListView(
            padding: EdgeInsets.zero,// xóa mọi padding của listview:
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Cong Doan"),
                accountEmail: Text("congdoan2703@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.lightBlue[100],
                  child: Text(
                    "D",
                    style: TextStyle(fontSize: 45.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home), title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings), title: Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts), title: Text("Contact Us"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        semanticLabel: 'Navigation Menu', // mô tả về Drawer cho công cụ hỗ trợ
        clipBehavior: Clip.antiAlias, // sử dụng để kiểm soát cách các widget con được cắt xén.
      ),

    );
  }
}
