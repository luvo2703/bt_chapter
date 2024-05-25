import 'package:flutter/material.dart';

////////bai3

class Exercise1_3 extends StatefulWidget {
  const Exercise1_3({Key? key}) : super(key: key);

  @override
  _Exercise1_3State createState() => _Exercise1_3State();
}

class _Exercise1_3State extends State<Exercise1_3> {
  final TextEditingController numbersController = TextEditingController();
  String result = '';

  bool isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  int calculateFactorial(int n) {
    if (n == 0) return 1;
    return n * calculateFactorial(n - 1);
  }

  int calculateFibonacci(int n) {
    if (n <= 1) return n;
    return calculateFibonacci(n - 1) + calculateFibonacci(n - 2);
  }

  Future<void> calculate() async {
    List<int> numbers = numbersController.text.split(',').map((number) => int.parse(number.trim())).toList();
    numbers.sort((a, b) => b.compareTo(a));

    if (numbers.length >= 2) {
      int secondLargest = numbers[1];
      result = 'Số lớn thứ nhì trong dãy là: $secondLargest\n';

      if (secondLargest % 2 == 0) {
        result += 'Số lớn thứ nhì là số chẵn.\n';
      } else {
        result += 'Số lớn thứ nhì là số lẻ.\n';
      }

      if (isPrime(secondLargest)) {
        result += 'Số lớn thứ nhì là số nguyên tố.\n';
      } else {
        result += 'Số lớn thứ nhì không là số nguyên tố.\n';
      }

      int factorial = calculateFactorial(secondLargest);
      result += 'Giai thừa của số lớn thứ nhì: $factorial\n';

      int fibonacci = calculateFibonacci(secondLargest);
      result += 'Số Fibonacci thứ $secondLargest: $fibonacci\n';
    } else {
      result = 'Không có số lớn thứ nhì trong dãy.';
    }

    await Future.delayed(Duration(seconds: 2)); // Chờ 2 giây

    setState(() {});

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
      appBar: AppBar(title: const Text('Bai 3')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset('assets/images/cau3.png'),
            TextField(
              controller: numbersController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nhập danh sách số, cách nhau bởi dấu ,',
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
    );
  }
}