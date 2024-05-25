import 'package:flutter/material.dart';

//bai 7
class Exercise1_7 extends StatefulWidget {
  const Exercise1_7({Key? key}) : super(key: key);

  @override
  _Exercise1_7State createState() => _Exercise1_7State();
}

class _Exercise1_7State extends State<Exercise1_7> {
  final TextEditingController xController = TextEditingController();
  String result = '';

  Future<void> calculate() async {
    int x = int.parse(xController.text);
    String a = x.toString();
    List<int> D = <int>[];
    int kq = 0;
    int m = 1;
    D.add(x);

    void HamXoa(int soluong, int vt) {
      var b = a.split('');
      b.removeRange(vt, vt + soluong);
      var x = int.parse(b.join(''));
      D.add(x);
      m++;
    }

    var dodai = a.length;
    for (var i = 1; i < dodai; i++) {
      for (var j = 0; j <= dodai - i; j++) {
        HamXoa(i, j);
      }
    }

    D = SapXep(D);
    kq = KiemTraHamTrung(D, m);

    await Future.delayed(Duration(seconds: 2)); // Chờ 2 giây

    setState(() {
      result = "Tổng số kết quả: $kq";
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

  KiemTraHamTrung(var D, var m) {
    var kq = 0;

    for (var i = 1; i < m; i++) {
      if (D[i] != D[i - 1]) {
        if (D[i] % 3 == 0) {
          kq++;
        }
      }
    }
    if (D[0] % 3 == 0) {
      kq++;
    }
    return kq;
  }

  SapXep(D) {
    D.sort();
    return D;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bai 7')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/cau7.png'),
              TextField(
                controller: xController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập số nguyên dương X',
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