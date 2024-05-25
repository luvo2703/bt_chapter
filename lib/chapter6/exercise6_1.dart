import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercise6_1 extends StatefulWidget {

  @override
  _Exercise6_1State createState() => _Exercise6_1State();
}

class _Exercise6_1State extends State<Exercise6_1> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.0),// Chiều cao của Scaffold

        child: AppBar(
          leading: IconButton( //Đây là widget đầu tiên trong AppBar, thường là một nút menu hoặc mũi tên quay lại.
            icon: Icon(Icons.menu),
            onPressed: (){},
          ),
          automaticallyImplyLeading: true,//Nếu đặt là true, AppBar sẽ tự động thêm một nút “Quay lại” nếu có Navigator có thể quay lại.
          elevation: 4.0,//Đây là độ cao của AppBar so với mặt phẳng của màn hình.
          scrolledUnderElevation: 4.0,//Đây là độ cao của AppBar khi người dùng cuộn AppBar dưới một widget khác.
          notificationPredicate: (ScrollNotification notification) {
            return true; // AppBar sẽ phản ứng với tất cả các thông báo cuộn
          },//Đây là hàm được gọi khi có thông báo cuộn. Nếu hàm trả về true, AppBar sẽ phản ứng với thông báo cuộn.
          shadowColor: Colors.amber,// đặt màu bóng cho appbar
          surfaceTintColor: Colors.blue,//Đặt màu cho AppBar khi nó được cuộn dưới một widget khác.
          shape: RoundedRectangleBorder(//đặt hình dáng cho appbar
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,//Đặt màu nền cho AppBar. lấy cùng màu với colorScheme
          foregroundColor: Colors.white,// màu của icon, text
          iconTheme: IconThemeData(//Đặt chủ đề cho các biểu tượng trong AppBar.
            color: Colors.red,
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.lightGreen,
          ),
          // primary: true,  //Nếu đặt là true, AppBar sẽ được hiển thị ở trên cùng của màn hình.
          // centerTitle: true,//Nếu đặt là true, tiêu đề của AppBar sẽ được căn giữa.
          // excludeHeaderSemantics: true,//Nếu đặt là true, AppBar sẽ không bao gồm các thông tin ngữ cảnh cho tiêu đề.
          // titleSpacing: 100.0,//Đặt khoảng cách cho tiêu đề của AppBar.
          // toolbarOpacity: 0.5,//Đặt độ trong suốt cho thanh công cụ của AppBar.
          // bottomOpacity: 0.5,//Đặt độ trong suốt cho phần dưới của AppBar.
          // toolbarHeight: 100.0,//Đặt chiều cao cho thanh công cụ của AppBar.
          // leadingWidth: 100.0,//Đặt chiều rộng cho widget đầu tiên của AppBar.
          // toolbarTextStyle: TextStyle(//Đặt kiểu chữ cho thanh công cụ của AppBar.
          //   color: Colors.white,
          //   fontSize: 20.0,
          // ),
          // titleTextStyle: TextStyle(// Đặt kiểu chữ cho tiêu đề của AppBar.
          //   color: Colors.white,
          //   fontSize: 30.0,
          // ),
          // systemOverlayStyle: SystemUiOverlayStyle.light,//Đặt kiểu cho hệ thống UI khi AppBar được hiển thị.
          // forceMaterialTransparency: true,//Nếu đặt là true, AppBar sẽ luôn trong suốt.
          // clipBehavior: Clip.hardEdge,//Đặt hành vi cắt cho AppBar.
          title: Text('Home'),//Đây là tiêu đề của AppBar
          actions: <Widget>[//Đây là danh sách các widget sẽ được hiển thị ở cuối AppBar.
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
          flexibleSpace: SafeArea(//Đây là không gian linh hoạt trong AppBar, cho phép bạn thêm các widget phức tạp hơn vào AppBar.
            child: Icon(
              Icons.photo_camera,
              size: 70.0,
              color: Colors.cyanAccent,
            ),
          ),
          bottom: PreferredSize(//Đây là widget ở dưới cùng của AppBar.
            child: Container(
              color: Colors.lightGreen.shade100,
              height: 75.0,
              width: double.infinity,
              child: Center(
                child: Text('Bottom'),
              ),
            ),
            preferredSize: Size.fromHeight(75.0),
          ),
        ),
      ),
      body: Center( //hiển thị nội dung
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Số lần bạn đã ấn nút này:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,//Vị trí FloatingActionButton
      // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,//FloatingActionButton sẽ co giãn khi di chuyển
      persistentFooterButtons: <Widget>[ //Danh sách các nút ở cuối Scaffold và luôn hiển thị.
        IconButton(icon: Icon(Icons.add_alarm), onPressed: () {}),
        IconButton(icon: Icon(Icons.add_comment), onPressed: () {}),
      ],
      persistentFooterAlignment: AlignmentDirectional.center,// căn chỉnh các nút cuối của Scaffold về cuối
      drawer: Drawer( //Đây là menu kéo ra từ bên trái. nếu enddrawer thì ngăn kéo sẽ kéo ra từ bên phải
        child: Material(
          //color: Colors.green, // được sử dụng để đặt màu nền cho Drawer
          shape: RoundedRectangleBorder( //
            borderRadius: BorderRadius.circular(10.0),// bo góc và đặt bán kính là 10.0
          ),

          child: ListView(
            padding: EdgeInsets.zero,// xóa mọi padding của listview:
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Cong Doan"),
                accountEmail: Text("congdoan2703@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.lightBlue[100],
                  child: Text(
                    "D",
                    style: TextStyle(fontSize: 45.0),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home), title: Text("Home"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings), title: Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts), title: Text("Contact Us"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        semanticLabel: 'Navigation Menu', // mô tả về Drawer cho công cụ hỗ trợ
        clipBehavior: Clip.antiAlias, // sử dụng để kiểm soát cách các widget con được cắt xén.
      ),
      onDrawerChanged: (bool isOpened) {
        print('Drawer is ' + (isOpened ? 'open' : 'closed'));//Hàm callback này được gọi khi trạng thái của drawer thay đổi.
      },
      // onEndDrawerChanged: (bool isOpened) {
      //   print('End drawer is ' + (isOpened ? 'open' : 'closed'));//Hàm callback này được gọi khi trạng thái của endDrawer thay đổi.
      // },
      // bottomNavigationBar: BottomNavigationBar(//Đây là thanh điều hướng ở cuối Scaffold.
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Business',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'School',
      //     ),
      //   ],
      // ),
      // bottomSheet: Container(
      //   color: Colors.blue,
      //   child: Center(
      //     child: Text('DART'),
      //   ),
      // ),
      // backgroundColor: Colors.blue,//Đặt màu nền cho Scaffold.
      // resizeToAvoidBottomInset: true,//Điều chỉnh kích thước của Scaffold để tránh thanh điều hướng dưới cùng.
      // primary: true,//Đặt Scaffold làm widget chính.
      drawerDragStartBehavior: DragStartBehavior.start,//Đặt hành vi kéo cho drawer.
      // extendBody: true,// Mở rộng phần thân của Scaffold ra sau bottomNavigationBar.
      // extendBodyBehindAppBar: true,//Mở rộng phần thân của Scaffold ra sau AppBar.
      drawerScrimColor: Colors.blue.withOpacity(0.5),//Đặt màu cho scrim của drawer.
      // Scrim là một lớp mờ hiển thị trên nội dung chính khi mở drawer.
      // drawerEdgeDragWidth: 30.0,// Đặt chiều rộng của vùng mà người dùng có thể kéo để mở drawer.
      // drawerEnableOpenDragGesture: true,//Cho phép người dùng kéo để mở drawer.
      // endDrawerEnableOpenDragGesture: true,//Cho phép người dùng kéo để mở endDrawer.
      // restorationId: 'myScaffold',//Đặt ID để khôi phục trạng thái của Scaffold.
    );
  }
}
