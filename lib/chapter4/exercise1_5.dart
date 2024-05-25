import 'package:flutter/material.dart';

//bai 5
class Exercise1_5 extends StatefulWidget {
  const Exercise1_5({Key? key}) : super(key: key);

  @override
  _Exercise1_5State createState() => _Exercise1_5State();
}

class _Exercise1_5State extends State<Exercise1_5> {
  final TextEditingController nController = TextEditingController();
  final TextEditingController contestsController = TextEditingController();
  String result = '';

  Future<void> calculate() async {
    int N = int.parse(nController.text);
    List<List<int>> contests = contestsController.text.split(',').map((str) => str.trim().substring(1, str.length - 1).split(' ').map((num) => int.parse(num)).toList()).toList();

    contests.sort((a, b) => a[1].compareTo(b[1]));

    int minRooms = 1;
    int currentEndTime = contests[0][1];

    for (int i = 1; i < N; i++) {
      if (contests[i][0] >= currentEndTime) {
        currentEndTime = contests[i][1];
      } else {
        minRooms++;
      }
    }

    await Future.delayed(Duration(seconds: 2)); // Chờ 2 giây

    setState(() {
      result = 'Số phòng cần ít nhất cho các cuộc thi: $minRooms';
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
      appBar: AppBar(title: const Text('Bai 5')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/cau5.png'),
              TextField(
                controller: nController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập số lượng cuộc thi N',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: contestsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập danh sách thời điểm bắt đầu và kết thúc của cuộc thi',
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