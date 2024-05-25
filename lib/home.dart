import 'package:flutter/material.dart';
import 'package:btvd_chapter/chapter4/chapter4.dart';
import 'package:btvd_chapter/chapter5/chapter5.dart';
import 'package:btvd_chapter/chapter6/chapter6.dart';
import 'package:btvd_chapter/chapter7/chapter7.dart';
import 'package:btvd_chapter/chapter8/chapter8.dart';
import 'package:btvd_chapter/chapter9/chapter9.dart';
import 'package:btvd_chapter/chapter10/chapter10.dart';
import 'package:btvd_chapter/chapter11/chapter11.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/gestures.dart';




class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(

        //scrollDirection: Axis.vertical, // Đặt hướng cuộn là dọc
        //reverse: false, // Đặt chế độ cuộn ngược là false
        //primary: true, // Nếu đặt là true, ListView sẽ sử dụng ScrollView ban đầu
        //physics: NeverScrollableScrollPhysics(),// ngăn cuộn
        //shrinkWrap: true, // nếu true, thì ListView sẽ thu nhỏ kích thước của mình để khớp với chiều cao của các con bên trong nó.
        padding: EdgeInsets.all(16.0),
        //itemExtent: 20.0, // Chiều cao cố định cho mỗi mục
        //itemExtentBuilder: (index, constraints) => index.isEven ? 50.0 : 100.0, //cho phép bạn xác định chiều cao động cho mỗi mục
        //prototypeItem: const ListTile(title: Text('Prototype')), // cho phép bạn xác định một mục mẫu
        // để ListView có thể ước lượng kích thước của các mục khác
        // findChildIndexCallback: (Key key) { //cho phép bạn xác định một hàm callback để tìm chỉ số của một mục con dựa trên Key của nó.
        //   final ValueKey valueKey = key as ValueKey;
        //   return int.tryParse(valueKey.value);
        // },
        //addAutomaticKeepAlives: true, //sử dụng để giữ các phần tử trong ListView luôn không bị tái tạo khi cuộn lại.
        //addRepaintBoundaries: true, //được sử dụng để đóng gói mỗi phần tử con trong một RepaintBoundary.
        // Điều này giúp cải thiện hiệu suất bằng cách tránh việc vẽ lại toàn bộ danh sách khi cuộn.
        //addSemanticIndexes: true, // gán chỉ số ngữ nghĩa cho phần tử con
        //dragStartBehavior: DragStartBehavior.start, //được sử dụng để xác định cách thức bắt đầu một hành động kéo
        // start, nó có nghĩa là hành động kéo sẽ bắt đầu ngay khi người dùng chạm vào widget.
        // down : kéo sẽ không bắt đầu khi người dùng chạm vào các phần tử con đó, mà chỉ khi chạm vào khu vực của chính widget đó.
        //cacheExtent: 1000, // Đặt giá trị cacheExtent là 1000 pixels
        // được sử dụng để đặt giới hạn cho số lượng phần tử của ListView được cấp phát vùng nhớ (cache) khi cuộn
        //semanticChildCount: 10, // được sử dụng để cung cấp một 'ước lượng' về số lượng phần tử con mà ListView sẽ hiển thị
        //restorationId: 'my_list_view', // được sử dụng để xác định một ID cho ListView, cho phép Flutter lưu trạng thái của ListView này
        //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
        // khi bàn phím xuất hiện, ScrollView không tự động ẩn đi bàn phím khi người dùng , onDrag sẽ tự động ẩn
        // Thay vào đó, ứng dụng sẽ giữ bàn phím hiển thị và người dùng phải tự chủ động ẩn nó.
        clipBehavior: Clip.hardEdge, // cắt khi nội dung vượt ngoài ranh giới của nó
        itemCount: 8, // Số lượng chương từ 4 đến 11 // đây là thuộc tính bắt buộc
        itemBuilder: (context, index) { //// Xây dựng một ListTile cho mỗi mục
          int chapterNumber = index + 4; // Chương bắt đầu từ 4
          return ListTile(
            title: Text('Chương $chapterNumber'),
            onTap: () {
              // Kiểm tra nếu chapterNumber là 4, 5, 6, 7, hoặc 8, điều hướng đến Chapter tương ứng
              if (chapterNumber == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chapter4()),
                );
              } else if (chapterNumber == 5) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chapter5()),
                );
              } else if (chapterNumber == 6) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chapter6()),
                );
              } else if (chapterNumber == 7) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chapter7()),
                );
              } else if (chapterNumber == 8) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chapter8()),
                );
              } else if (chapterNumber == 9) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chapter9()),
                );
              } else if (chapterNumber == 10) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chapter10()),
                );
              } else if (chapterNumber == 11) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chapter11()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChapterPage(chapterNumber)),
                );
              }
            },
          );

        },
      ),
    );
  }
}

class ChapterPage extends StatelessWidget {
  final int chapterNumber;

  ChapterPage(this.chapterNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chương $chapterNumber'),
      ),
      body: Center(
        child: Text('Danh sách các bài tập của Chương $chapterNumber'),
      ),
    );
  }
}
