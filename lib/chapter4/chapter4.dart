// import 'package:flutter/material.dart';
// import 'exercise1.dart';
// import 'exercise2.dart';
//
// class Chapter4 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Chương 4')),
//       body: ListView.builder(
//         itemCount: 5, // Số lượng bài tập trong Chương 4
//         itemBuilder: (context, index) {
//           return ElevatedButton(
//             onPressed: () {
//               // Dựa vào số thứ tự của bài tập để quyết định điều hướng đến trang nào
//               switch (index + 1) {
//                 case 1:
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Exercise1()),
//                   );
//                   break;
//                 case 2:
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => Exercise2()),
//                   );
//                   break;
//               // Thêm các trường hợp khác cho các bài tập khác ở đây
//               }
//             },
//             child: Text('Đi đến Bài ${index + 1}'),
//           );
//         },
//       ),
//     );
//   }
// }
