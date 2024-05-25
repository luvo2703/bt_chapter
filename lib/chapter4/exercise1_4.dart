import 'package:flutter/material.dart';


//bai 4
class Exercise1_4 extends StatefulWidget {
  const Exercise1_4({Key? key}) : super(key: key);

  @override
  _Exercise1_4State createState() => _Exercise1_4State();
}

class _Exercise1_4State extends State<Exercise1_4> {

  final TextEditingController nController = TextEditingController();
  final TextEditingController distancesController = TextEditingController();
  // Hai dòng này khai báo hai đối tượng `TextEditingController`.
  // Chúng được sử dụng để đọc văn bản từ các widget `TextField`
  // và lắng nghe các thay đổi.

  String result = '';
  // Dòng này khai báo một biến `String` tên `result` để lưu kết quả của phép tính.

  void calculate() {
    // Hàm này tính toán sự khác biệt nhỏ nhất giữa hai khoảng cách.
    Future<void> calculate() async {
      // Nhập số lượng phần tử n
      int n = int.parse(nController.text);

      // Nhập dãy số d1, d2, ..., dn
      List<int> distances = distancesController.text.split(',').map((number) => int.parse(number.trim())).toList();

      // Sắp xếp dãy số theo thứ tự tăng dần
      distances.sort();

      // Tính độ lệch giữa các cặp đoạn đường
      int minDifference = distances[1] - distances[0];
      for (int i = 2; i < n; i++) {
        //tính khoảng cách giữa đoạn đường thứ i và đoạn đường thứ i - 1.
        int difference = distances[i] - distances[i - 1];
        if (difference < minDifference) {
          minDifference = difference;
        }
      }

      await Future.delayed(Duration(seconds: 2)); // Chờ 2 giây

      setState(() {
        result = 'Độ lệch nhỏ nhất giữa hai đoạn đường : $minDifference';
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

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: const Text('Bai 4')),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // Đặt padding cho tất cả các cạnh là 8.0.

        child: SingleChildScrollView(


          child: Column(
            // `Column` là một widget để sắp xếp con của nó theo chiều dọc.
            children: [
              // `children` là một danh sách các widget con.
              Image.asset('assets/images/cau4.png'),

              TextField(
                // `TextField` là một widget để nhập văn bản.
                controller: nController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập số lượng phần tử n',
                  // `labelText` là một nhãn cho `TextField`.
                ),
              ),
              SizedBox(height: 8),
              // `SizedBox` là một hộp có kích thước cố định. Ở đây,
              // nó được sử dụng để tạo ra khoảng cách giữa các widget.

              TextField(
                controller: distancesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập dãy số d1, d2, ..., dn (cách nhau bởi dấu ,)',
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: calculate,
                // `onPressed` là một hàm được gọi khi nút được nhấn.
                // Ở đây, nó gọi hàm `calculate`.

                child: const Text('Bắt đầu tính toán'),
              ),
              SizedBox(height: 8),
              Text(result),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                // Khi nút này được nhấn, nó sẽ gọi `Navigator.pop(context)` để quay lại màn hình trước đó.

                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}