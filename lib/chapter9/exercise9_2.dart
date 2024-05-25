//GridView
import 'package:flutter/material.dart';

class Exercise9_2 extends StatefulWidget {
  const Exercise9_2({Key? key}) : super(key: key);

  @override
  _Exercise9_2State createState() => _Exercise9_2State();
}
class _Exercise9_2State extends State<Exercise9_2> {
  // final ScrollController _scrollController = ScrollController();
  // // Tạo một ScrollController


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('GridView Example'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'Count'),
                Tab(text: 'Extent'),
                Tab(text: 'Builder'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // GridView.count

              GridView.count(
                //controller: _scrollController, // _scrollController được sử dụng để điều khiển cuộn của GridView
                scrollDirection: Axis.vertical, // hướng cuộn : dọc
                //reverse: true,// hướng cuộn ngược lại
                //primary: false, //GridView có phải là cuộn chính trong ứng dụng hay không.
                // physics: BouncingScrollPhysics(),//xác định cách GridView cuộn
                // shrinkWrap: true, //Xác định liệu GridView có nên co lại để phù hợp với nội dung của nó hay không.
                // padding: EdgeInsets.all(10.0),// đặt padding cho GridView
                 crossAxisCount: 3, // số lượng cột tối đa
                // mainAxisSpacing: 10.0, //Đặt khoảng cách giữa các hàng trong GridView.
                // crossAxisSpacing: 10.0, // Đặt khoảng cách giữa các cột trong GridView.
                // childAspectRatio: 1.5,//Xác định tỷ lệ giữa chiều rộng và chiều cao của mỗi ô.
                // addAutomaticKeepAlives: true,//Xác định liệu GridView có nên tự động giữ các ô không hoạt động hay không.
                // addRepaintBoundaries: true,//Xác định liệu GridView có nên thêm các ranh giới vẽ lại hay không.
                // addSemanticIndexes: true,//???Xác định liệu GridView có nên thêm các chỉ mục ngữ nghĩa hay không.
                // cacheExtent: 100.0, //Xác định kích thước cache của GridView.
                // semanticChildCount: 2,//??? Xác định số lượng con ngữ nghĩa của GridView. chưa nắm rõ
                // dragStartBehavior: DragStartBehavior.start,// Khi kéo, bắt đầu từ vị trí ban đầu
                // down :  kéo sẽ bắt đầu tại vị trí đầu tiên mà người dùng chạm vào màn hình.
                // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, //bàn phím sẽ bị loại bỏ khi người dùng kéo GridView.
                // clipBehavior: Clip.hardEdge,//bất kỳ phần nào của phần tử con nằm ngoài ranh giới của GridView sẽ bị cắt đi hoàn toàn.
                // restorationId: 'myGridView',// ID phục hồi của GridView là ‘myGridView’.
                children: List.generate(20, (index) { //Danh sách các mục con để hiển thị trong lưới.
                  return Card(
                    child: Center(child: Text('Item $index')),
                  );
                }),
              ),
              // GridView.extent
              GridView.extent(
                //reverse: true, // cuộn ngược lại so với hướng hiện tại
                //scrollDirection: Axis.horizontal, // Hướng cuộn (ngang hoặc dọc)
                //padding: EdgeInsets.all(100.0), // Padding xung quanh lưới
                //controller: _controller,//kiểm soát cuộn,
                // primary: true,//xác định liệu GridView có phải là cuộn chính không
                // physics: AlwaysScrollableScrollPhysics(),//): Định nghĩa cách lưới cuộn
                // shrinkWrap: false,//Nếu đặt là true, lưới sẽ thu nhỏ lại kích thước của nó theo trục cuộn.
                maxCrossAxisExtent: 150,//Đây là kích thước tối đa của mỗi ô theo trục ngang.
                // mainAxisSpacing: 0.0,//Khoảng cách giữa các mục dọc theo trục chính.
                // crossAxisSpacing: 0.0,//Khoảng cách giữa các mục dọc theo trục ngang.
                // childAspectRatio: 1.0,//Tỉ lệ giữa chiều ngang và chiều dọc của mỗi mục.
                // addAutomaticKeepAlives: true,//mỗi mục con sẽ được bao bọc bởi một AutomaticKeepAlive
                // addRepaintBoundaries: true,//, mỗi mục con sẽ được bao bọc bởi một RepaintBoundary
                // addSemanticIndexes: true,//mỗi mục con sẽ được bao bọc bởi một IndexedSemantics
                // cacheExtent: 300.0,//Kích thước của khu vực cache trước và sau phần hiển thị trên màn hình
                // semanticChildCount: 5,// thông báo cho hệ thống trợ năng về số lượng con mà GridView có
                // dragStartBehavior: DragStartBehavior.start,// Khi kéo, bắt đầu từ vị trí ban đầu
                // down :  kéo sẽ bắt đầu tại vị trí đầu tiên mà người dùng chạm vào màn hình.
                // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, //bàn phím sẽ bị loại bỏ khi người dùng kéo GridView.
                // clipBehavior: Clip.hardEdge,//bất kỳ phần nào của phần tử con nằm ngoài ranh giới của GridView sẽ bị cắt đi hoàn toàn.
                // restorationId: 'myGridView',// ID phục hồi của GridView là ‘myGridView’.
                children: List.generate(20, (index) { //Danh sách các mục con để hiển thị trong lưới.
                  return Card(
                    child: Center(child: Text('Item $index')),
                  );
                }),
              ),
              // GridView.builder
              GridView.builder(
                //scrollDirection: Axis.vertical,//Định hướng cuộn của lưới. Mặc định là Axis.vertical, có nghĩa là lưới sẽ cuộn theo chiều dọc.
                //reverse: true,//Nếu đặt là true, lưới sẽ cuộn theo hướng ngược lại.
                //controller: _controller,//kiểm soát cuộn,
                primary: true,//xác định liệu GridView có phải là cuộn chính không
                physics: AlwaysScrollableScrollPhysics(),//): Định nghĩa cách lưới cuộn
                shrinkWrap: false,//Nếu đặt là true, lưới sẽ thu nhỏ lại kích thước của nó theo trục cuộn.
                padding: EdgeInsets.all(100.0), // Padding xung quanh lưới
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( //SliverGridDelegate kiểm soát cách sắp xếp các mục con trong GridView.
                  crossAxisCount: 3,
                ),
                itemCount: 20,// số lượng mục sẽ tạo ra trong danh sách
                // addAutomaticKeepAlives: true,//mỗi mục con sẽ được bao bọc bởi một AutomaticKeepAlive
                // addRepaintBoundaries: true,//, mỗi mục con sẽ được bao bọc bởi một RepaintBoundary
                // addSemanticIndexes: true,//mỗi mục con sẽ được bao bọc bởi một IndexedSemantics
                // cacheExtent: 300.0,//Kích thước của khu vực cache trước và sau phần hiển thị trên màn hình
                // semanticChildCount: 5,// thông báo cho hệ thống trợ năng về số lượng con mà GridView có
                // dragStartBehavior: DragStartBehavior.start,// Khi kéo, bắt đầu từ vị trí ban đầu
                // down :  kéo sẽ bắt đầu tại vị trí đầu tiên mà người dùng chạm vào màn hình.
                // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, //bàn phím sẽ bị loại bỏ khi người dùng kéo GridView.
                // clipBehavior: Clip.hardEdge,//bất kỳ phần nào của phần tử con nằm ngoài ranh giới của GridView sẽ bị cắt đi hoàn toàn.
                // restorationId: 'myGridView',// ID phục hồi của GridView là ‘myGridView’.
                // findChildIndexCallback: (Key key) {
                //   final ValueKey valueKey = key as ValueKey;
                //   final int index = valueKey.value;
                //   return index;
                // },//là một hàm nhận vào một Key và trả về một int?, đại diện cho chỉ số của con có Key đó
                  //sử dụng ValueKey cho mỗi Card và findChildIndexCallback để tìm chỉ số của Card dựa trên ValueKey của nó
                itemBuilder: (BuildContext context, int index) { //itemBuilder tạo ra một Card cho mỗi mục
                  // trong danh sách. Mỗi Card chứa một Center widget, bên trong đó là một Text widget hiển thị ‘Item $index’, với
                  return Card(
                    child: Center(child: Text('Item $index')),
                  );
                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}

