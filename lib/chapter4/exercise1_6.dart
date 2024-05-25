import 'package:flutter/material.dart';

//bai 6
class Exercise1_6 extends StatefulWidget {
  const Exercise1_6({Key? key}) : super(key: key);

  @override
  _Exercise1_6State createState() => _Exercise1_6State();
}

class _Exercise1_6State extends State<Exercise1_6> {
  final TextEditingController AController = TextEditingController();
  final TextEditingController BController = TextEditingController();
  String result = '';

  bool isPrime(int number) {
    if (number <= 1) {
      return false;
    }
    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  bool isPalindrome(int number) {
    String numString = number.toString();
    int length = numString.length;
    for (int i = 0; i < length ~/ 2; i++) {
      if (numString[i] != numString[length - 1 - i]) {
        return false;
      }
    }
    return true;
  }

  Future<void> calculate() async {
    int A = int.parse(AController.text);
    int B = int.parse(BController.text);
    int count = 0;
    List<int> beautifulPlates = [];
    for (int i = A; i <= B; i++) {
      if (isPrime(i) && isPalindrome(i)) {
        count++;
        beautifulPlates.add(i);
      }
    }

    await Future.delayed(Duration(seconds: 2)); // Chờ 2 giây

    setState(() {
      result = 'Số lượng biển số xe đẹp: $count\n' +
          'Các biển số xe đẹp:\n' +
          beautifulPlates.join('\n');
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
      appBar: AppBar(title: const Text('Bai 6')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/cau6.png'),
              TextField(
                controller: AController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập số nguyên dương A',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: BController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập số nguyên dương B',
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