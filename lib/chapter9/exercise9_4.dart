//CustomscrollView
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Exercise9_4 extends StatelessWidget {
  // Khởi tạo một ScrollController
  // final ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(

          scrollDirection: Axis.vertical, // hướng cuộn là dọc
          reverse: false, //// Không đảo ngược danh sách
          //controller: _controller, // Sử dụng ScrollController đã khởi tạo để kiểm soát cuộn.
          //primary: true, // Đặt CustomScrollView là thanh cuộn chính
          //physics: const BouncingScrollPhysics(), // cho phép nó cuộn quá giới hạn và sau đó bật lại khi người dùng kéo nội dung quá giới hạn của nó.
          //scrollBehavior: const ScrollBehavior(), // Sử dụng ScrollBehavior mặc định
          // shrinkWrap: true, // thu nhỏ để phù hợp với kích thước nội dung thay vì mở rộng để điền vào không gian có sẵn.
          // center: null, // Không có widget trung tâm,Nếu bạn cung cấp một Key cho thuộc tính này
          // CustomScrollView sẽ đảm bảo rằng widget có Key tương ứng luôn ở giữa danh sách khi cuộn.
          // anchor: 0.0, //  điều này có nghĩa là CustomScrollView sẽ bắt đầu cuộn từ đầu danh sách.
          // Nếu bạn đặt giá trị khác ví dụ như 0.5, CustomScrollView sẽ bắt đầu cuộn từ giữa danh sách.
          cacheExtent: null, // Không đặt bộ nhớ cache
          //cacheExtent: 200.0, //cache các widget con trong khoảng cách cuộn là 200.0, giúp cải thiện hiệu suất cuộn.
          //semanticChildCount: 10,//cung cấp thông tin về số lượng con ngữ nghĩa cho các công cụ hỗ trợ như công cụ đọc màn hình.
          dragStartBehavior: DragStartBehavior.start,//cuộn sẽ bắt đầu ngay lập tức khi người dùng bắt đầu kéo.
          //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,// bàn phím sẽ tự động ẩn khi người dùng cuộn.
          restorationId: 'myCustomScrollView', //ID phục hồi là ‘myCustomScrollView’, điều này giúp lưu và khôi phục trạng thái cuộn khi ứng dụng bị hủy và khởi động lại.
          clipBehavior: Clip.hardEdge,//bất kỳ phần nào của phần tử con nằm ngoài ranh giới của GridView sẽ bị cắt đi hoàn toàn.
          slivers: <Widget>[
            // Slivers là các phần tử con của CustomScrollView
            SliverAppBar(
              // Các thuộc tính cơ bản của SliverAppBar
              expandedHeight: 200.0,
              floating: false,
              pinned: false,
              snap: false,
              stretch: false,
              stretchTriggerOffset: 100.0,
              onStretchTrigger: () {
                // Hành động khi stretch trigger được kích hoạt
                return Future<void>.value();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              toolbarHeight: kToolbarHeight,
              // leadingWidth: 100.0, // Chiều rộng tùy chỉnh cho leading widget
              // // Các thuộc tính về style
              // toolbarTextStyle: TextStyle(
              //   color: Colors.purple,
              //   fontSize: 18.0,
              // ),
              // titleTextStyle: TextStyle(
              //   color: Colors.orange,
              //   fontSize: 20.0,
              // ),
              //systemOverlayStyle: SystemUiOverlayStyle.dark, // Style cho system overlay
              // forceMaterialTransparency: false,
              // leading: IconButton(
              //   icon: Icon(Icons.menu),
              //   onPressed: () {
              //     // Hành động khi nút menu được nhấn
              //   },
              // ),
              // automaticallyImplyLeading: true,
              title: Text('Sliver AppBar'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Hành động khi nút tìm kiếm được nhấn
                  },
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Sliver AppBar'),
                background: Image.asset(
                  'assets/images/berry.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              // bottom: PreferredSize(
              //   preferredSize: Size.fromHeight(50.0),
              //   child: TabBar(
              //     tabs: [
              //       Tab(icon: Icon(Icons.info)),
              //       Tab(icon: Icon(Icons.lightbulb_outline)),
              //     ],
              //   ),
              // ),
              // elevation: 4.0,
              // Các thuộc tính về màu sắc và shadow
              // scrolledUnderElevation: 2.0,
              // shadowColor: Colors.grey,
              // surfaceTintColor: Colors.blue,
              // forceElevated: false,
              // backgroundColor: Colors.green,
              // foregroundColor: Colors.white,
              // Các thuộc tính về icon theme
              // iconTheme: IconThemeData(
              //   color: Colors.red,
              // ),
              // actionsIconTheme: IconThemeData(
              //   color: Colors.yellow,
              // ),
              // Các thuộc tính về tiêu đề và khoảng cách
              // primary: true,
              // centerTitle: true,
              // excludeHeaderSemantics: false,
              // titleSpacing: NavigationToolbar.kMiddleSpacing,
              // collapsedHeight: 60.0,
              //expandedHeight: 200.0,
            ),
            SliverSafeArea(
              //minimum: EdgeInsets.zero,//thiết lập padding an toàn là 0, điều này có nghĩa là các mục trong danh sách
              // sẽ hiển thị ngay sát các cạnh an toàn của màn hình
              top: true,
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Card(
                      child: Container(
                        alignment: Alignment.center,
                        height: 100.0,
                        child: Text('List Item ${index + 1}'),
                      ),
                    );
                  },
                  childCount: 10,
                ),
              ),
            ),
            SliverList( // SliverList là một danh sách có thể cuộn được
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      alignment: Alignment.center,
                      height: 100.0,
                      child: Text('List Item ${index + 1}'),
                    ),
                  );
                },
                childCount: 10,
              ),
            ),

            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('Grid Item ${index + 1}'),
                    ),
                  );
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}