import 'package:flutter/material.dart';


// bai 1

class Exercise1_1 extends StatefulWidget {
  const Exercise1_1({Key? key}) : super(key: key);

  @override
  _Exercise1_1State createState() => _Exercise1_1State(); // Tạo trạng thái cho StatefulWidget
}
// Định nghĩa trạng thái cho StatefulWidget
class _Exercise1_1State extends State<Exercise1_1> {
  final TextEditingController nController = TextEditingController(); // Controller cho TextField nhập giá trị N
  String result = ''; // Chuỗi kết quả
  // Hàm tính toán
  // Hàm tính toán
  Future<void> calculate() async {
    var N = BigInt.parse(nController.text); // Chuyển đổi giá trị nhập từ TextField sang BigInt
    // Hàm giải mã số M từ số N
    String decode(BigInt num) {
      if (num < BigInt.from(10)) { // Nếu số nhỏ hơn 10, trả về chuỗi biểu diễn của số
        return num.toString();
      } else {
        var strNum = num.toString(); // Chuyển đổi số sang chuỗi
        var count = 1; // Biến đếm số lần xuất hiện của các chữ số
        var result = ''; // Chuỗi kết quả
        for (var i = 1; i < strNum.length; i++) { // Duyệt qua từng chữ số trong chuỗi
          if (strNum[i] == strNum[i - 1]) { // Nếu chữ số hiện tại trùng với chữ số trước đó
            count++; // Tăng biến đếm
          } else { // Nếu chữ số hiện tại khác chữ số trước đó
            result += count.toString() + strNum[i - 1]; // Ghi lại số lần xuất hiện và chữ số trước vào chuỗi kết quả
            count = 1; // Đặt lại biến đếm
          }
        }
        result += count.toString() + strNum[strNum.length - 1]; // Ghi lại số lần xuất hiện và chữ số cuối cùng vào chuỗi kết quả
        return decode(BigInt.parse(result)); // Gọi đệ qui với số BigInt được tạo từ chuỗi kết quả
      }
    }
    var M = decode(N); // Tìm số M từ số N
    await Future.delayed(Duration(seconds: 2)); // Chờ 2 giây
    setState(() {
      result = 'Kết quả: $M'; // Cập nhật kết quả
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
    return Scaffold( // Tạo một Scaffold, cung cấp cấu trúc cơ bản cho ứng dụng
      appBar: AppBar(title: const Text('Bai 1')), // Tạo một AppBar với tiêu đề là 'Bai 1'
      body: Padding( // Tạo một Padding để tạo khoảng cách xung quanh nội dung bên trong
        padding: const EdgeInsets.all(8.0), // Đặt padding là 8.0 cho tất cả các cạnh
        child: SingleChildScrollView( // Tạo một SingleChildScrollView để cho phép cuộn nếu nội dung vượt quá kích thước màn hình
          child: Column( // Tạo một Column để sắp xếp các widget theo chiều dọc
            children: [
              Image.asset('assets/images/cau1.png'), // Hiển thị một hình ảnh từ tài nguyên ứng dụng
              TextField( // Tạo một TextField để nhập giá trị N
                controller: nController, // Sử dụng nController để kiểm soát giá trị của TextField
                decoration: InputDecoration( // Tạo một InputDecoration để tùy chỉnh giao diện của TextField
                  border: OutlineInputBorder(), // Đặt viền cho TextField
                  labelText: 'Nhập giá trị N', // Đặt nhãn cho TextField
                ),
              ),
              SizedBox(height: 8), // Tạo một SizedBox để tạo khoảng cách giữa các widget
              ElevatedButton( // Tạo một ElevatedButton để bắt đầu tính toán
                onPressed: calculate, // Khi nhấn vào button thì gọi hàm calculate
                child: const Text('Bắt đầu tính toán'), // Đặt nhãn cho button
              ),
              SizedBox(height: 8), // Tạo một SizedBox để tạo khoảng cách giữa các widget
              Text(result), // Hiển thị kết quả
              SizedBox(height: 8), // Tạo một SizedBox để tạo khoảng cách giữa các widget
              ElevatedButton( // Tạo một ElevatedButton để quay lại
                onPressed: () {
                  Navigator.pop(context); // Khi nhấn vào button thì quay lại màn hình trước
                },
                child: const Text('Go Back'), // Đặt nhãn cho button
              ),
            ],
          ),
        ),
      ),
    );
  }

}