//Tabbar
import 'package:flutter/material.dart';


class Exercise8_4 extends StatefulWidget {
  @override
  _Exercise8_4State createState() => _Exercise8_4State();
}

class _Exercise8_4State extends State<Exercise8_4> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tabbar'), // Tiêu đề của AppBar
          bottom: TabBar( // TabBar để tạo các tab
            controller: _tabController,
            //isScrollable: false, // Các tab không cuộn được
            //padding: EdgeInsets.all(10.0), // Padding cho TabBar cách đều 10.0
            //indicatorColor: Colors.yellow, // Màu của chỉ số tab
            //automaticIndicatorColorAdjustment: true, // tự động điều chỉnh màu sắc của chỉ số dựa trên màu sắc của tab.
            //indicatorWeight: 4.0, // Độ dày của chỉ số, indicatorWeight được đặt thành 4.0
            //indicatorPadding: EdgeInsets.zero, // không có padding cho chỉ số
            // indicator: BoxDecoration( // Trang trí cho chỉ số
            //   gradient: LinearGradient(
            //     colors: [Colors.red, Colors.yellow], // Gradient từ màu đỏ sang màu vàng
            //   ),
            // ),
            //indicatorSize: TabBarIndicatorSize.tab, // Kích thước của chỉ số
            //  dividerColor: Colors.cyanAccent, // Màu của dấu phân cách
            //  dividerHeight: 3.0, // Chiều cao của dấu phân cách
            //  labelColor: Colors.amberAccent, // Màu của nhãn
            // labelStyle: TextStyle( // Kiểu chữ cho nhãn
            //   fontSize: 20.0, // Kích thước chữ
            //   fontWeight: FontWeight.bold, // Độ đậm của chữ
            // ),
            // labelPadding: EdgeInsets.symmetric(vertical: 20.0), // Padding cho nhãn
            // unselectedLabelColor: Colors.lightGreen, // khi không được chọn có màu xám
            // unselectedLabelStyle: TextStyle( // Kiểu chữ cho nhãn khi không được chọn
            //   fontSize: 16.0, // Kích thước chữ
            //   fontWeight: FontWeight.normal, // Độ đậm của chữ
            // ),
            //dragStartBehavior: DragStartBehavior.start ,// Khi kéo, bắt đầu từ vị trí ban đầu
            //overlayColor: MaterialStateProperty.all(Colors.orange.withOpacity(0.1)), // Màu overlay khi tab được nhấn
            //mouseCursor: SystemMouseCursors.click, // Con trỏ chuột khi di chuyển qua tab //???? chưa thấy rõ
            //enableFeedback: true, // Kích hoạt âm thanh và rung khi tương tác với tab
            // onTap: (index) { // Hàm được gọi khi tab được nhấn
            //   print('Tab $index đã nhấn');
            // },
            //physics: BouncingScrollPhysics(), // Hiệu ứng cuộn cho TabBar //??? chưa thấy rõ
            //splashFactory: InkRipple.splashFactory, // Hiệu ứng splash khi tab được nhấn //??? chưa thấy rõ
            //splashBorderRadius: BorderRadius.circular(15.0), // Bo góc và bán kính 15.0
            //tabAlignment: TabAlignment.center, // Căn chỉnh tab ở giữa
            tabs: [ // Danh sách các tab
              Tab(icon: Icon(Icons.directions_car), text: 'Car'), // Thêm nhãn 'Car'
              Tab(icon: Icon(Icons.directions_transit), text: 'Transit'), // Thêm nhãn 'Transit'
              Tab(icon: Icon(Icons.directions_bike), text: 'Bike'), // Thêm nhãn 'Bike'
            ],
          ),
        ),
          body: TabBarView( // Nội dung của từng tab
            controller: _tabController, //chỉ định một TabController để quản lý việc chuyển đổi giữa các tab.
            //physics: BouncingScrollPhysics(),// khi người dùng cuộn đến cuối danh sách
            // nó sẽ “nhảy” một chút trước khi dừng lại, tạo ra hiệu ứng giống như iOS.tạo cảm giác mượt mà
            //dragStartBehavior: DragStartBehavior.start,//việc kéo sẽ bắt đầu tại vị trí ban đầu mà người dùng bắt đầu chạm vào màn hình.
            clipBehavior: Clip.hardEdge,//cắt nếu nội dung vượt ra ngoài
            children: [ // Danh sách các nội dung tab
              Container(color: Colors.red), // Nội dung tab đầu tiên
              Container(color: Colors.green), // Nội dung tab thứ hai
              Container(color: Colors.blue), // Nội dung tab thứ ba
            ],
          ),
      ),
    );
  }
}
