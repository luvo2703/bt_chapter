//Card
import 'package:flutter/material.dart';

class Exercise9_1 extends StatefulWidget {
  const Exercise9_1({Key? key}) : super(key: key);

  @override
  _Exercise9_1State createState() => _Exercise9_1State();
}

class _Exercise9_1State extends State<Exercise9_1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Card(
            elevation: 16.0, // Độ rộng của bóng
            color: Colors.white, // màu của card
            shadowColor: Colors.cyanAccent, //bóng màu xanh
            margin: EdgeInsets.all(16.0), //  đặt lè xung quanh là 16
            //surfaceTintColor: Colors.red,//sẽ có một màu phủ màu đỏ lên màu nền của nó.
            clipBehavior: Clip.hardEdge, // Cắt
            shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange.withOpacity(0.5))),
            // Tạo đường viền hình chữ nhật bo góc
            // và độ dày cũng như màu của viền
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hạ Long',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48.0,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  'Travel Plans',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Card(
            elevation: 16.0,
            color: Colors.white,
            shadowColor: Colors.cyanAccent,
            margin: EdgeInsets.all(16.0),
            shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange.withOpacity(0.5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Phú Quốc',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48.0,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  'Travel Plans',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Card(
            elevation: 16.0,
            color: Colors.white,
            shadowColor: Colors.cyanAccent,
            margin: EdgeInsets.all(16.0),
            shape: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrange.withOpacity(0.5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Cát Bà',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48.0,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  'Travel Plans',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
