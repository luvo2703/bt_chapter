//c8_bottom nav

import 'package:flutter/material.dart';
import 'birthdays.dart';
import 'gratitude.dart';
import 'reminders.dart';

class Exercise8_2 extends StatefulWidget {
  @override
  _Exercise8_2State createState() => _Exercise8_2State();
}

class _Exercise8_2State extends State<Exercise8_2> {
  int _currentIndex = 0;
  final List _listPages = [];

  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _listPages
      ..add(Birthdays())
      ..add(Gratitude())
      ..add(Reminders());
    _currentPage = Birthdays();
  }

  void _changePage(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
      _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  double iconSize = 48.0;
  // double selectedFontSize = 56.0;
  // double unselectedFontSize = 24.0;
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('BottomNavigationBar'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: _currentPage,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        // elevation: 8.0,  // elevation giúp tạo ra hiệu ứng đổ bóng cho BottomNavigationBar
        // giúp nó có vẻ như đang nổi lên so với các widget xung quanh.
        type: BottomNavigationBarType.fixed,//Đây là loại mặc định khi có ít hơn bốn mục. Mục được chọn được hiển thị với màu selectedItemColor
        //type: BottomNavigationBarType.shifting,//Đây là loại mặc định khi có bốn mục trở lên. Nếu selectedItemColor là null, tất cả các mục sẽ được hiển thị bằng màu trắng.
        selectedItemColor: Colors.red,//Sử dụng màu đỏ cho mục được chọn
        backgroundColor: Colors.cyanAccent, //màu nền của thanh bottomnav màu cyantAccent
        //fixedColor: Colors.lightGreen,// Đây là thuộc tính đã lỗi thời trong BottomNavigationBar và chỉ sử dụng khiBottomNavigationBarType.fixed được chọn.
        // Nó đặt màu cho mục được chọn khi danh sách các mục có từ 2 đến 4 mục.
        //selectedItemColor là thuộc tính hiện đại hơn và thay thế cho fixedColor. với nhiều hơn 4 mục nên sử dụng selectedItemColor
        // selectedFontSize: selectedFontSize,
        // unselectedFontSize: unselectedFontSize,
        // đặt kích thước của nhãn khi mục được chọn là 56.0 kích thước của nhãn của nó sẽ thay đổi theo giá trị này.
        // Kích thước của nhãn khi mục không được chọn là 24.0
        // selectedLabelStyle: TextStyle(
        //   color: Colors.red,
        //   fontWeight: FontWeight.bold,
        // ),
        // unselectedLabelStyle: TextStyle(
        //   color: Colors.blue,
        //   fontWeight: FontWeight.normal,
        // ),
        //Khi một mục được chọn, nhãn của nó sẽ hiển thị theo TextStyle này (màu đỏ).
        // Khi mục đó không được chọn, nhãn sẽ hiển thị theo TextStyle của thuộc tính unselectedLabelStyle.(màu xanh)

        currentIndex: _currentIndex, //Đây là thuộc tính xác định mục nào trên thanh điều hướng dưới cùng đang được chọn.
        iconSize: iconSize,
        unselectedItemColor: Colors.amberAccent, // đặt màu của các mục chưa được chọn thành màu amber
        // selectedIconTheme: IconThemeData(
        //   color: Colors.red,
        //   size: 30.0,
        //   opacity: 0.8,
        // ),
        // unselectedIconTheme: IconThemeData( //Khi không được chọn thì icon màu xanh, Khi mục đó được chọn, biểu tượng sẽ la đỏ
        //   color: Colors.blue,
        //   size: 20.0,
        //   opacity: 0.6,
        // ),
        items: [ //Đây là danh sách các mục sẽ hiển thị trên thanh điều hướng dưới cùng.
          // Mỗi mục là một BottomNavigationBarItem, bao gồm một biểu tượng (icon) và một nhãn (label).
          BottomNavigationBarItem(
            icon: Icon(Icons.cake, size: iconSize),
            label: 'Birthdays',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied, size: iconSize,),
            label: 'Gratitude',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm,size: iconSize, ),
            label: 'Reminders',
          ),
        ],
        onTap: (selectedIndex) => _changePage(selectedIndex),//Đây là hàm sẽ được gọi khi người dùng chạm vào một mục trên thanh điều hướng dưới cùng.
        // showSelectedLabels: true, // Hiển thị nhãn khi mục được chọn
        // showUnselectedLabels: false, // Ẩn nhãn khi mục không được chọn
        // mouseCursor: SystemMouseCursors.click, // Đặt con trỏ chuột khi di chuyển qua các mục ??? chưa thấy sự khác biệt
        // enableFeedback: true, // Kích hoạt âm thanh phản hồi khi nhấp vào mục
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,//khi thiết bị ở chế độ ngang
        // các mục trong BottomNavigationBar sẽ được phân tán đều trên toàn bộ chiều rộng của thanh.
        //còn centered nếu bạn muốn các mục được tập trung ở giữa thanh khi ở chế độ ngang.
        //useLegacyColorScheme: true,//sẽ sử dụng hệ thống màu sắc cũ ??????
      ),
    );
  }
}
