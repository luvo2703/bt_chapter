import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'trip.dart';


class Exercise11_3 extends StatefulWidget {
  @override
  _Exercise11_3State createState() => _Exercise11_3State();
}

class _Exercise11_3State extends State<Exercise11_3> {
  List<Trip> _trips = [];

  @override
  void initState() {
    super.initState();
    _trips
      ..add(Trip(id: '0', tripName: 'Rome', tripLocation: 'Italy'))
      ..add(Trip(id: '1', tripName: 'Paris', tripLocation: 'France'))
      ..add(Trip(id: '2', tripName: 'New York', tripLocation: 'USA - New York'))
      ..add(Trip(id: '3', tripName: 'Cancun', tripLocation: 'Mexico'))
      ..add(Trip(id: '4', tripName: 'London', tripLocation: 'England'))
      ..add(Trip(id: '5', tripName: 'Sydney', tripLocation: 'Australia'))
      ..add(Trip(id: '6', tripName: 'Miami', tripLocation: 'USA - Florida'))
      ..add(Trip(id: '7', tripName: 'Rio de Janeiro', tripLocation: 'Brazil'))
      ..add(Trip(id: '8', tripName: 'Cusco', tripLocation: 'Peru'))
      ..add(Trip(id: '9', tripName: 'New Delhi', tripLocation: 'India'))
      ..add(Trip(id: '10', tripName: 'Tokyo', tripLocation: 'Japan'));
  }

  void _markTripCompleted() {
    // Mark trip completed in Database or web service
  }

  void _deleteTrip() {
    // Delete trip from Database or web service
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dismissible Trips'),
      ),
      body: ListView.builder(
        itemCount: _trips.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_trips[index].id),
            onDismissed: (direction) {
              direction == DismissDirection.startToEnd
                  ? _markTripCompleted()
                  : _deleteTrip();
              setState(() {
                _trips.removeAt(index);
              });
            },
            background: _buildCompleteTrip(),// Màu nền hiển thị khi người dùng vuốt từ trái sang phải (hoàn thành chuyến đi).
            secondaryBackground: _buildRemoveTrip(),//Màu nền hiển thị khi người dùng vuốt từ phải sang trái (xóa chuyến đi).
            // confirmDismiss: (direction) async {
            //   // Xác nhận việc vuốt để xóa hoặc đánh dấu chuyến đi hoàn thành
            //   // Trả về true để cho phép vuốt, hoặc false để ngăn không cho vuốt
            //   return true;
            // },
            // onResize: () {
            //   // Xử lý khi widget được resize
            // },
            // onUpdate: (details) {
            //   // Xử lý khi widget được cập nhật
            // },
            // direction: DismissDirection.horizontal, // Hướng vuốt (ngang)
            // resizeDuration: Duration(milliseconds: 300), // Thời gian resize
            // dismissThresholds: <DismissDirection, double>{}, // Ngưỡng vuốt để xóa
            // movementDuration: Duration(milliseconds: 200), // Thời gian di chuyển
            // crossAxisEndOffset: 0.0, // Khoảng cách từ điểm chạm đến đầu cuối theo chiều ngang
            // dragStartBehavior: DragStartBehavior.start, // Hành vi khi bắt đầu kéo
            // behavior: HitTestBehavior.opaque, // Xác định hành vi khi kiểm tra va chạm (có thể là opaque, translucent, hoặc deferToChild).
            child: _buildListTile(index),//danh sách child
          );
        },
      ),
    );
  }

  Widget _buildListTile(int index) {
    return ListTile(
      title: Text(_trips[index].tripName),
      subtitle: Text(_trips[index].tripLocation),
      leading: Icon(Icons.flight),
      trailing: Icon(Icons.fastfood),
    );
  }

  Widget _buildCompleteTrip() {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.done,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemoveTrip() {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
