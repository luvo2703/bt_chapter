import 'package:flutter/material.dart';

class Exercise11_2 extends StatefulWidget {
  @override
  _Exercise11_2State createState() => _Exercise11_2State();
}

class _Exercise11_2State extends State<Exercise11_2> {
  Offset _startLastOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  double _lastScale = 1.0;
  double _currentScale = 1.0;
  var deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestures & Scaling'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final deviceWidth = MediaQuery
        .of(context)
        .size
        .width;

    return GestureDetector(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _transformScaleAndTranslate(),
          // _transformMatrix4(),
          _positionedStatusBar(context),
          _positionedInkWellAndInkResponse(context),
        ],
      ),
      onScaleStart: _onScaleStart,
      onScaleUpdate: _onScaleUpdate,
      onDoubleTap: _onDoubleTap,
      onLongPress: _onLongPress,
    );
  }

  Transform _transformScaleAndTranslate() {
    return Transform.scale(
      scale: _currentScale,
      child: Transform.translate(
        offset: _currentOffset,
        child: Image.asset(
          'assets/images/elephant.png',
          width: deviceWidth,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Comment out _transformMatrix4() for now
  // Widget _transformMatrix4() {
  //   // ...
  // }

  Positioned _positionedStatusBar(BuildContext context) {
    final statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    return Positioned(
      top: 0,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Container(
        height: 50,
        color: Colors.white54,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Scale: ${_currentScale.toStringAsFixed(4)}',
            ),
            Text(
              'Current: $_currentOffset',
            ),
          ],
        ),
      ),
    );
  }
  Positioned _positionedInkWellAndInkResponse(BuildContext context) {
    var myFocusNode;
    var _handleFocusChange;
    var myStatesController;
    return Positioned(
      top: 50.0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white54,
        height: 56.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              child: Container(
                height: 48.0,
                width: 128.0,
                color: Colors.black12,
                child: Icon(
                  Icons.touch_app,
                  size: 32.0,
                ),
              ),
              splashColor: Colors.lightGreenAccent,//xác định màu nền hiển thị khi người dùng chạm vào InkWell
              highlightColor: Colors.lightBlueAccent,//Màu nền hiển thị khi InkWell được nhấn.
              onTap: _setScaleSmall,
              onDoubleTap: _setScaleBig,
              onLongPress: _onLongPress,
              // onTapDown: _handleTapDown, // Được gọi khi người dùng bắt đầu chạm vào InkWell.
              // Tham số TapDownDetails chứa thông tin về vị trí chạm (ví dụ: tọa độ x, y).
              // onTapUp: _handleTapUp, // Được gọi khi người dùng kết thúc chạm vào InkWell
              //Tham số TapUpDetails chứa thông tin về vị trí kết thúc chạm.
              // onTapCancel: _handleTapCancel, // Được gọi khi người dùng hủy bỏ cử chỉ chạm vào InkWell (ví dụ: di chuyển ra khỏi vùng chạm).
              // onSecondaryTap: _handleSecondaryTap, // Được gọi khi người dùng thực hiện cử chỉ chạm phụ (ví dụ: nhấn chuột phải).
              // onSecondaryTapUp: _handleSecondaryTapUp, // Được gọi khi người dùng kết thúc cử chỉ chạm phụ.
              //Tham số TapUpDetails chứa thông tin về vị trí kết thúc chạm phụ.
              // onSecondaryTapDown: _handleSecondaryTapDown, // Được gọi khi người dùng bắt đầu cử chỉ chạm phụ.
              //Tham số TapDownDetails chứa thông tin về vị trí chạm phụ.
              // onSecondaryTapCancel: _handleSecondaryTapCancel, // Được gọi khi người dùng hủy bỏ cử chỉ chạm phụ.
              //onHighlightChanged: _handleHighlightChanged, // Được gọi khi trạng thái “highlight” của InkWell thay đổi
              // ví dụ: khi người dùng di chuột qua hoặc ra khỏi vùng chạm.
              //onHover: _handleHover, // Được gọi khi người dùng di chuột qua InkWell.
              //mouseCursor: SystemMouseCursors.click, //  Xác định kiểu con trỏ chuột khi di chuột qua InkWell.
              //focusColor: Colors.red, // Màu nền hiển thị khi InkWell được focus.
              //hoverColor: Colors.blue, // Màu nền hiển thị khi người dùng di chuột qua InkWell.
              //overlayColor: MaterialStateProperty.all(Colors.green), //  Màu nền hiển thị khi InkWell có trạng thái khác ví dụ: khi focus hoặc hover.
              //splashFactory: InkRipple.splashFactory, // Xác định loại hiệu ứng “splash” (màu nền phát ra từ điểm chạm).
              radius: 10.0, // Xác định bán kính của hiệu ứng “splash”
              borderRadius: BorderRadius.circular(8.0), // Xác định góc bo tròn cho InkWell.
              customBorder: RoundedRectangleBorder( //Xác định hình dạng biên tùy chỉnh cho InkWell
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.black),
              ),
              enableFeedback: false, // Xác định xem có hiển thị phản hồi âm thanh khi người dùng tương tác không.
              excludeFromSemantics: true, // Xác định xem InkWell có bị loại bỏ khỏi hệ thống ngữ nghĩa không.
              focusNode: myFocusNode, // Xác định nút focus cho InkWell.
              canRequestFocus: true,//xác định xem InkWell có thể yêu cầu focus (được chọn) hay không. 
              // Nếu bạn đặt giá trị của thuộc tính này là true, InkWell có thể yêu cầu focus khi người dùng tương tác với nó
              onFocusChange: _handleFocusChange, //Được gọi khi trạng thái focus của InkWell thay đổi.
              autofocus: true, // Xác định xem InkWell có tự động focus khi được hiển thị không.
              statesController: myStatesController, // Xác định bộ điều khiển trạng thái cho InkWell
              hoverDuration: Duration(milliseconds: 200), // Xác định thời gian di chuột qua để kích hoạt hiệu ứng hover.
            ),

            InkResponse(
              child: Container(
                height: 48.0,
                width: 128.0,
                color: Colors.black12,
                child: Icon(
                  Icons.touch_app,
                  size: 32.0,
                ),
              ),
              splashColor: Colors.lightGreenAccent,
              highlightColor: Colors.lightBlueAccent,
              onTap: _setScaleSmall,
              onDoubleTap: _setScaleBig,
              onLongPress: _onLongPress,
              statesController: myStatesController, // Xác định bộ điều khiển trạng thái cho InkResponse.
              highlightShape: BoxShape.circle, // Xác định hình dạng của vùng highlight khi người dùng tương tác với InkResponse.
              // Trong trường hợp này, giá trị là BoxShape.circle là hình tròn
            ),
            //InkWell thuong được sử dụng để tạo các nút hoặc khu vực có thể nhấn được trên giao diện người dùng
            // trong khi InkResponse thường được sử dụng để tạo các khu vực phản hồi mà không cần chứa phần tử con.

          ],
        ),
      ),
    );
  }
  void _setScaleSmall() {
    setState(() {
      _currentScale = 0.5;
    });
  }
  void _setScaleBig() {
    setState(() {
      _currentScale = 16.0;
    });
  }


  void _onScaleStart(ScaleStartDetails details) {
    print('ScaleStartDetails: $details');
    _startLastOffset = details.focalPoint;
    _lastOffset = _currentOffset;
    _lastScale = _currentScale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    print('ScaleUpdateDetails: $details - Scale: ${details.scale}');
    if (details.scale != 1.0) {
      // Scaling
      double currentScale = _lastScale * details.scale;
      if (currentScale < 0.5) {
        currentScale = 0.5;
      }
      setState(() {
        _currentScale = currentScale;
      });
      print('_scale: $_currentScale - _lastScale: $_lastScale');
    } else if (details.scale == 1.0) {
      // Moving
      // Calculate offset depending on current Image scaling.
      Offset offsetAdjustedForScale = (_startLastOffset - _lastOffset) /
          _lastScale;
      Offset currentOffset = details.focalPoint -
          (offsetAdjustedForScale * _currentScale);
      setState(() {
        _currentOffset = currentOffset;
      });
      print(
          'offsetAdjustedForScale: $offsetAdjustedForScale - _currentOffset: $_currentOffset');
    }
  }

  void _onDoubleTap() {
    print('onDoubleTap');
    // Calculate current scale and populate the _lastScale with currentScale
    // if currentScale is greater than 16 times the original image, reset scale to default, 1.0
    double currentScale = _lastScale * 2.0;
    if (currentScale > 16.0) {
      currentScale = 1.0;
      _resetToDefaultValues();
    }
    _lastScale = currentScale;
    setState(() {
      _currentScale = currentScale;
    });
  }

  void _onLongPress() {
    print('onLongPress');
    setState(() {
      _resetToDefaultValues();
    });
  }

  void _resetToDefaultValues() {
    _startLastOffset = Offset.zero;
    _lastOffset = Offset.zero;
    _currentOffset = Offset.zero;
    _lastScale = 1.0;
    _currentScale = 1.0;
  }
}