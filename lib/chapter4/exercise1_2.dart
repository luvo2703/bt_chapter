import 'package:flutter/material.dart';

//bai 2

class Exercise1_2 extends StatefulWidget {
  const Exercise1_2({Key? key}) : super(key: key);

  @override
  _Exercise1_2State createState() => _Exercise1_2State();
}

class _Exercise1_2State extends State<Exercise1_2> {
  final TextEditingController aController = TextEditingController();
  final TextEditingController bController = TextEditingController();
  String result = '';

  Future<void> calculate() async {
    int a = int.parse(aController.text);
    int b = int.parse(bController.text);
    int count = 0;
    int sum = 0;

    for (int i = a; i <= b; i++) {
      if (i % 6 == 0) {
        count++;
        sum += i;
      }
    }
    await Future.delayed(Duration(seconds: 2)); // Chờ 2 giây
    setState(() {
      result = 'Số lượng số chẵn chia hết cho 3 trong đoạn [$a, $b]: $count\n'
          'Tổng của các số chẵn chia hết cho 3: $sum';
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bai 2')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/cau2.png'),
              TextField(
                controller: aController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập giá trị a',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: bController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập giá trị b',
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