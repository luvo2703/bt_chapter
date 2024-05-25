import 'dart:convert';
import 'package:flutter/material.dart';

// bai 8
class Exercise1_8 extends StatefulWidget {
  const Exercise1_8({Key? key}) : super(key: key);

  @override
  _Exercise1_8State createState() => _Exercise1_8State();
}

class _Exercise1_8State extends State<Exercise1_8> {
  final TextEditingController xyController = TextEditingController();
  final TextEditingController hmController = TextEditingController();
  final TextEditingController abcController = TextEditingController();
  String result = '';

  Future<void> calculate() async {
    List<List<int>> xy = jsonDecode(xyController.text);
    List<List<int>> hm = jsonDecode(hmController.text);
    List<List<int>> abc = jsonDecode(abcController.text);

    double rs = 0;
    int n = 3; // số loại điện trong thanh toán

    for (int i = 0; i < n; i++) {
      rs += tinhTien(xy[i][0], xy[i][1], abc[i][0], abc[i][1], abc[i][2],
          hm[i][0], hm[i][1]);
    }

    await Future.delayed(Duration(seconds: 2)); // Chờ 2 giây

    setState(() {
      result = 'Kết quả: $rs';
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Kết quả'),
          content: Text(result),
          actions: <Widget>[
            TextButton(
              child: Text('Đóng'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  tinhTien(x, y, a, b, c, hm1, hm2) {
    int z = y - x;
    double kq = 0;
    if (z <= hm1) {
      kq = a * z;
    } else if (z > hm1 && z <= hm2) {
      kq = kq + a * hm1 + b * (z - hm1);
    } else {
      kq = kq + a * hm1 + b * (hm2 - hm1) + c * (z - hm2);
    }
    return kq;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bai 8')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/cau8.png'),
              TextField(
                controller: xyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập giá trị xy',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: hmController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập giá trị hm',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: abcController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập giá trị abc',
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: calculate,
                child: const Text('Bắt đầu tính toán'),
              ),
              SizedBox(height: 8),
              Text(result),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
