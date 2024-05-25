import 'package:flutter/material.dart';

class Exercise11_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GestureDetector',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _gestureDetected = '';
  Color _paintedColor = Colors.deepOrange; // Initialize with a default color
  Offset _startLastOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  double _lastScale = 1.0;
  double _currentScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GestureDetector & Draggable'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildGestureDetector(),
              Divider(
                color: Colors.black,
                height: 44.0,
              ),
              _buildDraggable(),
              Divider(
                height: 40.0,
              ),
              _buildDragTarget(),
              Divider(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        print('onTapDown: $details');
      },//Được gọi khi người dùng bắt đầu chạm vào màn hình. TapDownDetails cung cấp thông tin chi tiết về sự kiện chạm.
      //onSecondaryTapDown:tương tự nhưng cho chạm thứ 2
      //onTertiaryTapDown : tương tự nhưng cho chạm thứ 3
      onTapUp: (TapUpDetails details) {
        print('onTapUp: $details');
      },// Được gọi khi người dùng ngừng chạm vào màn hình. TapUpDetails cung cấp thông tin chi tiết về sự kiện chạm.
      //onSecondaryTapUp :tương tự nhưng cho chạm thứ 2
      //onTertiaryTapUp :tương tự nhưng cho chạm thứ 3
      onTapCancel: () {
        print('onTapCancel');
      },//Được gọi khi người dùng hủy chạm.

      onSecondaryTap: () {
        print('onSecondaryTap');
      }, //Được gọi khi người dùng chạm vào màn hình bằng ngón tay thứ hai.

      onTap: () {
        print('onTap');
        _displayGestureDetected('onTap');
      },//Được gọi khi người dùng nhấn vào màn hình.

      onDoubleTap: () {
        print('onDoubleTap');
        _displayGestureDetected('onDoubleTap');
      },//Được gọi khi người dùng nhấn đúp vào màn hình.

      onLongPress: () {
        print('onLongPress');
        _displayGestureDetected('onLongPress');
      }, //Được gọi khi người dùng nhấn giữ vào màn hình.
      //onSecondaryLongPress : tương tự nhưng cho cái chạm thứ 2
      //onTertiaryLongPress : tương tự nhưng cho cái chạm thứ 3

      onPanUpdate: (DragUpdateDetails details) {
        print('onPanUpdate: $details');
        _displayGestureDetected('onPanUpdate:\n$details');
      },//Được gọi khi người dùng di chuyển ngón tay trên màn hình. DragUpdateDetails cung cấp thông tin chi tiết về sự kiện kéo.

      // onSecondaryTapCancel: () {
      //   print('onSecondaryTapCancel');
      // },//Được gọi khi người dùng hủy chạm thứ hai. Bạn có thể sử dụng nó để xử lý các hành động cần thực hiện khi chạm thứ hai bị hủy.
      //
      // onTertiaryTapCancel: () {
      //   print('onTertiaryTapCancel');
      // },//Được gọi khi người dùng hủy chạm thứ ba. Bạn có thể sử dụng nó để xử lý các hành động cần thực hiện khi chạm thứ ba bị hủy.
      //
      // onDoubleTapDown: (TapDownDetails details) {
      //   print('onDoubleTapDown: $details');
      // },//Được gọi khi người dùng bắt đầu chạm đúp. TapDownDetails cung cấp thông tin chi tiết về sự kiện chạm.
      //
      // onDoubleTapCancel: () {
      //   print('onDoubleTapCancel');
      // },//Được gọi khi người dùng hủy chạm đúp. TapDownDetails cung cấp thông tin chi tiết về sự kiện chạm.
      //
      // // onLongPressDown: (LongPressDownDetails details) {
      // //   print('onLongPressDown: $details');
      // // },//Được gọi khi người dùng bắt đầu chạm giữ. LongPressDownDetails cung cấp thông tin chi tiết về sự kiện chạm.
      // //onSecondaryLongPressDown : tương tự nhưng cho cái chạm thứ 2
      // //onTertiaryLongPressDown :tương tự nhưng cho cái chạm thứ 3
      //
      // onLongPressCancel: () {
      //   print('onLongPressCancel');
      // },//Được gọi khi người dùng hủy chạm giữ. LongPressDownDetails cung cấp thông tin chi tiết về sự kiện chạm.
      // //onSecondaryLongPressCancel : tương tự nhưng cho cái chạm thứ 2
      // //onTertiaryLongPressCancel : tương tự nhưng cho cái chạm thứ 3
      //
      // onLongPressStart: (LongPressStartDetails details) {
      //   print('onLongPressStart: $details');
      // },//Được gọi khi người dùng bắt đầu nhấn giữ. LongPressStartDetails cung cấp thông tin chi tiết về sự kiện nhấn giữ.
      // //onSecondaryLongPressStart : tương tự nhưng cho cái chạm thứ 2
      // //onTertiaryLongPressStart : tương tự nhưng cho cái chạm thứ 3
      //
      // onLongPressMoveUpdate: (LongPressMoveUpdateDetails details) {
      //   print('onLongPressMoveUpdate: $details');
      // },// Được gọi khi người dùng di chuyển ngón tay trong khi nhấn giữ.
      // // LongPressMoveUpdateDetails cung cấp thông tin chi tiết về sự kiện di chuyển.
      // //onSecondaryLongPressMoveUpdate : tương tự nhưng cho cái chạm thứ 2
      // //onTertiaryLongPressMoveUpdate : tương tự nhưng cho cái chạm thứ 3
      //
      // onLongPressUp: () {
      //   print('onLongPressUp');
      // },//Được gọi khi người dùng ngừng nhấn giữ.
      // //onSecondaryLongPressUp :tương tự nhưng cho cái chạm thứ 2
      // //onTertiaryLongPressUp : tương tự nhưng cho cái chạm thứ 3
      //
      // onLongPressEnd: (LongPressEndDetails details) {
      //   print('onLongPressEnd: $details');
      // },// Được gọi khi người dùng kết thúc nhấn giữ. LongPressEndDetails cung cấp thông tin chi tiết về sự kiện kết thúc nhấn giữ.
      // //onSecondaryLongPressEnd : tương tự nhưng cho cái chạm thứ 2
      // //onTertiaryLongPressEnd : tương tự nhưng cho cái chạm thứ 3
      //
      // onVerticalDragDown: (DragDownDetails details) {
      //   print('onVerticalDragDown: $details');
      // },//Được gọi khi một chạm kéo dọc xuống bắt đầu. DragDownDetails cung cấp thông tin chi tiết về vị trí chạm trên màn hình.
      //
      // onVerticalDragStart: (DragStartDetails details) {
      //   print('onVerticalDragStart: $details');
      // },//Được gọi khi chạm bắt đầu di chuyển dọc theo màn hình.
      // // DragStartDetails cung cấp thông tin chi tiết về vị trí chạm và tốc độ di chuyển ban đầu.
      //
      // onVerticalDragUpdate: (DragUpdateDetails details) {
      //   print('onVerticalDragUpdate: $details');
      // },//Được gọi khi chạm di chuyển dọc theo màn hình. DragUpdateDetails cung cấp thông tin chi tiết về vị trí chạm và tốc độ di chuyển
      //
      // onVerticalDragEnd: (DragEndDetails details) {
      //   print('onVerticalDragEnd: $details');
      // },//Được gọi khi chạm kết thúc di chuyển dọc theo màn hình.
      // // DragEndDetails cung cấp thông tin chi tiết về tốc độ di chuyển cuối cùng khi chạm kết thúc.
      //
      // onVerticalDragCancel: () {
      //   print('onVerticalDragCancel');
      // },//Được gọi khi chạm bị hủy (ví dụ: người dùng bắt đầu kéo nhưng sau đó di chuyển ngón tay ra khỏi màn hình).
      //
      // onHorizontalDragDown: (DragDownDetails details) {
      //   print('onHorizontalDragDown: $details');
      // },//Được gọi khi một chạm kéo ngang xuống bắt đầu. DragDownDetails cung cấp thông tin chi tiết về vị trí chạm trên màn hình.
      //
      // onHorizontalDragStart: (DragStartDetails details) {
      //   print('onHorizontalDragStart: $details');
      // },//Được gọi khi chạm bắt đầu di chuyển ngang trên màn hình.
      // // DragStartDetails cung cấp thông tin chi tiết về vị trí chạm và tốc độ di chuyển ban đầu.
      //
      // onHorizontalDragUpdate: (DragUpdateDetails details) {
      //   print('onHorizontalDragUpdate: $details');
      // },//Được gọi khi chạm di chuyển ngang trên màn hình. DragUpdateDetails cung cấp thông tin chi tiết về vị trí chạm và tốc độ di chuyển.
      //
      // onHorizontalDragEnd: (DragEndDetails details) {
      //   print('onHorizontalDragEnd: $details');
      // },//Được gọi khi chạm kết thúc di chuyển ngang trên màn hình.
      // // DragEndDetails cung cấp thông tin chi tiết về tốc độ di chuyển cuối cùng khi chạm kết thúc.
      //
      // onHorizontalDragCancel: () {
      //   print('onHorizontalDragCancel');
      // },//Được gọi khi chạm bị hủy (ví dụ: người dùng bắt đầu kéo nhưng sau đó di chuyển ngón tay ra khỏi màn hình).
      //
      // onForcePressStart: (ForcePressDetails details) {
      //   print('onForcePressStart: $details');
      // },//Được gọi khi người dùng bắt đầu nhấn mạnh. ForcePressDetails cung cấp thông tin chi tiết về sự kiện nhấn mạnh.
      //
      // onForcePressPeak: (ForcePressDetails details) {
      //   print('onForcePressPeak: $details');
      // },//Được gọi khi người dùng đạt đến mức nhấn mạnh tối đa. ForcePressDetails cung cấp thông tin chi tiết về sự kiện nhấn mạnh.
      //
      // onForcePressUpdate: (ForcePressDetails details) {
      //   print('onForcePressUpdate: $details');
      // },//cung cấp thông tin chi tiết về sự kiện nhấn mạnh.
      //
      // onForcePressEnd: (ForcePressDetails details) {
      //   print('onForcePressEnd: $details');
      // },//Được gọi khi người dùng kết thúc nhấn mạnh. ForcePressDetails cung cấp thông tin chi tiết về sự kiện nhấn mạnh.
      //
      // onPanDown: (DragDownDetails details) {
      //   print('onPanDown: $details');
      // },//Được gọi khi một chạm kéo xuống bắt đầu. DragDownDetails cung cấp thông tin chi tiết về vị trí chạm trên màn hình.
      //
      // onPanStart: (DragStartDetails details) {
      //   print('onPanStart: $details');
      // },// Được gọi khi chạm bắt đầu di chuyển trên màn hình.
      // // DragStartDetails cung cấp thông tin chi tiết về vị trí chạm và tốc độ di chuyển ban đầu.
      //
      // // onPanUpdate: (DragUpdateDetails details) {
      // //   print('onPanUpdate: $details');
      // // },//Được gọi khi chạm di chuyển trên màn hình. DragUpdateDetails cung cấp thông tin chi tiết về vị trí chạm và tốc độ di chuyển.
      //
      // onPanEnd: (DragEndDetails details) {
      //   print('onPanEnd: $details');
      // },//Được gọi khi chạm kết thúc di chuyển trên màn hình.
      // // DragEndDetails cung cấp thông tin chi tiết về tốc độ di chuyển cuối cùng khi chạm kết thúc.
      //
      // onPanCancel: () {
      //   print('onPanCancel');
      // },//Được gọi khi chạm bị hủy (ví dụ: người dùng bắt đầu kéo nhưng sau đó di chuyển ngón tay ra khỏi màn hình).
      //
      // onScaleStart: (ScaleStartDetails details) {
      //   print('Scale has started with details: $details');
      // },//Được gọi khi người dùng bắt đầu thao tác thu phóng. ScaleStartDetails cung cấp thông tin chi tiết về sự kiện thu phóng.
      //
      // onScaleUpdate: (ScaleUpdateDetails details) {
      //   print('Scale is updating with details: $details');
      // },//Được gọi khi người dùng cập nhật thao tác thu phóng. ScaleUpdateDetails cung cấp thông tin chi tiết về sự kiện thu phóng.
      //
      // onScaleEnd: (ScaleEndDetails details) {
      //   print('Scale has ended with details: $details');
      // },//Được gọi khi người dùng kết thúc thao tác thu phóng.ScaleEndDetails cung cấp thông tin chi tiết về sự kiện thu phóng.
      //
      // behavior: HitTestBehavior.opaque,// Định nghĩa cách thức GestureDetector nên hoạt động trong cây hit test.
      // // HitTestBehavior là một enum với các giá trị deferToChild, opaque, translucent.
      //
      // excludeFromSemantics: false,//Nếu đặt là true, thì GestureDetector sẽ không tham gia
      // // vào cây ngữ nghĩa, ngăn chặn khả năng truy cập bằng công cụ hỗ trợ.
      //
      // dragStartBehavior: DragStartBehavior.start, //: Định nghĩa cách thức bắt đầu thao tác kéo.
      //
      // trackpadScrollCausesScale: false,//Nếu đặt là true, thì cuộn trackpad sẽ gây ra thao tác thu phóng.
      //
      // trackpadScrollToScaleFactor: Offset.zero, //Định nghĩa tỷ lệ chuyển đổi giữa cuộn trackpad và thao tác thu phóng.
      // supportedDevices: Set.from([PointerDeviceKind.touch, PointerDeviceKind.mouse]),
      // //Định nghĩa các loại thiết bị mà GestureDetector hỗ trợ.
      // // PointerDeviceKind là một enum với các giá trị touch, mouse, stylus, unknown, invertedscreen.

      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.access_alarm,
              size: 98.0,
            ),
            Text('$_gestureDetected'),
          ],
        ),
      ),
    );
  }

  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }

  Draggable<int> _buildDraggable() {
    return Draggable(
      child: Column(
        children: <Widget>[
          Icon(
            Icons.palette,
            color: Colors.deepOrange,
            size: 48.0,
          ),
          Text('Drag Me below to change color'),
        ],
      ),
      childWhenDragging: Icon(
        Icons.palette,
        color: Colors.grey,
        size: 48.0,
      ),
      feedback: Icon(
        Icons.brush,
        color: Colors.deepOrange,
        size: 80.0,
      ),
      data: Colors.deepOrange.value,
    );
  }

  DragTarget<int> _buildDragTarget() {
    return DragTarget<int>(
      // onAccept: (colorValue) { // onAccept: Được gọi khi dữ liệu được chấp nhận bởi DragTarget.
      //   setState(() {
      //     _paintedColor = Color(colorValue);
      //   });
      // },
      // builder: Xây dựng giao diện người dùng cho DragTarget.
      builder: (BuildContext context, List<dynamic> acceptedData,
          List<dynamic> rejectedData) {
        return acceptedData.isEmpty
            ? Text(
          'Drag To and see color change',
          style: TextStyle(color: _paintedColor),
        )
            : Text(
          'Painting Color: ${Color(acceptedData[0])}',
          style: TextStyle(
            color: Color(acceptedData[0]),
            fontWeight: FontWeight.bold,
          ),
        );
      },
      // onWillAccept: Được gọi khi có sự kiện "drag" và DragTarget kiểm tra xem liệu nó có chấp nhận dữ liệu hay không.
      // onWillAccept: (colorValue) {
      //   // Kiểm tra điều kiện trước khi chấp nhận dữ liệu (nếu cần).
      //   // Trả về true hoặc false tùy thuộc vào điều kiện.
      //   return true; // Ví dụ: luôn chấp nhận dữ liệu.
      // },
      // onWillAcceptWithDetails: Tương tự như onWillAccept, nhưng cung cấp thông tin chi tiết về sự kiện "drag".
      onWillAcceptWithDetails: (details) {
        // Kiểm tra điều kiện và xử lý dữ liệu dựa trên thông tin chi tiết.
        return true; // Ví dụ: luôn chấp nhận dữ liệu.
      },
      // onLeave: Được gọi khi dữ liệu bị rời khỏi DragTarget.
      onLeave: (colorValue) {
        // Xử lý dữ liệu khi nó không còn nằm trong DragTarget.
      },
      // onMove: Được gọi khi dữ liệu đang được kéo di chuyển trong DragTarget.
      onMove: (details) {
        // Xử lý dữ liệu khi nó đang di chuyển.
      },
      // hitTestBehavior: Xác định cách DragTarget xử lý sự kiện hit test (điểm chạm).
      hitTestBehavior: HitTestBehavior.translucent, // Mặc định là translucent.
      // Có thể đặt giá trị là HitTestBehavior.opaque hoặc HitTestBehavior.deferToChild.
    );
  }
}
