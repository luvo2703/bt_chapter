import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercise6_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Example'),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() {
    return _MyCustomFormState();
  }
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();
  final myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        canPop: true,//Nếu đặt là true, người dùng có thể thoát khỏi Form bằng cách nhấn nút quay lại.
        onPopInvoked: (bool isPopped) {//Hàm callback này được gọi khi người dùng nhấn nút quay lại.
          print('Form is popped: $isPopped');
        },
        // onWillPop: () async { //Hàm callback này được gọi khi người dùng nhấn nút quay lại.
        //   // Nếu hàm trả về false, người dùng sẽ không thể thoát khỏi Form.
        //   return false; // Người dùng không thể thoát khỏi Form
        // },
        onChanged: () {//Hàm callback này được gọi khi giá trị của bất kỳ FormField nào trong Form thay đổi.
          print('giá trị của FormField vừa thay đổi');
        },
        autovalidateMode: AutovalidateMode.always,// Đặt chế độ tự động xác thực cho Form. Nếu đặt là AutovalidateMode.always
        // Form sẽ tự động xác thực các FormField sau mỗi lần thay đổi giá trị.
        child: Column( //Đây là widget con bắt buộc của Form. Nó thường bao gồm một hoặc nhiều FormField.
          children: [
            TextFormField(
              // initialValue: 'Hello World',//Giá trị khởi tạo cho TextFormField.
              // controller: myController,//Điều khiển giá trị của TextFormField.
              // focusNode: myFocusNode,//Quản lý trạng thái focus của TextFormField.
              decoration: InputDecoration(//Đặt trang trí cho TextFormField.
                border: OutlineInputBorder(),
                labelText: 'Nhập gì đó',
              ),
              keyboardType: TextInputType.emailAddress,//Đặt kiểu bàn phím cho TextFormField.
              textCapitalization: TextCapitalization.words,//Đặt chế độ viết hoa cho TextFormField.
              textInputAction: TextInputAction.go,//Đặt hành động khi người dùng nhấn nút “Done” trên bàn phím.
              // style: TextStyle( //Đặt kiểu chữ cho văn bản trong TextFormField.
              //   color: Colors.blue,
              //   fontSize: 20.0,
              // ),
              // strutStyle: StrutStyle( // Đặt kiể u strut, điều chỉnh khoảng cách giữa các dòng văn bản.
              //   fontSize: 66.0,
              //   fontWeight: FontWeight.w500,
              // ),
              // textDirection: TextDirection.ltr,//Đặt hướng văn bản (ltr hoặc rtl).
              // textAlign: TextAlign.center,//Đặt căn lề cho văn bản.
              // textAlignVertical: TextAlignVertical.center,//Đặt căn lề dọc cho văn bản.
              // autofocus: true,// Nếu đặt là true, TextFormField sẽ tự động nhận focus khi nó được hiển thị.
              // readOnly: true,//Nếu đặt là true, người dùng không thể chỉnh sửa văn bản trong TextFormField.
              // toolbarOptions: ToolbarOptions(//Cung cấp các tùy chọn cho thanh công cụ khi người dùng chọn văn bản.
              //   copy: true,
              //   cut: true,
              //   paste: true,
              //   selectAll: true,
              // ),
              //showCursor: true,//Hiển thị con trỏ khi người dùng tương tác với TextFormField.
              // obscureText: true,//Ẩn văn bản. Điều này thường được sử dụng cho các trường mật khẩu.
              // obscuringCharacter: '*',// Ký tự sẽ thay thế cho văn bản khi obscureText được đặt là true.
              // autocorrect: true,//tự động sửa lỗi chính tả
              // smartDashesType: SmartDashesType.disabled,//Kiểm soát việc chuyển đổi dấu gạch ngang thành dấu gạch ngang thông minh.
              // smartQuotesType: SmartQuotesType.disabled,//Kiểm soát việc chuyển đổi dấu ngoặc kép và dấu ngoặc đơn thành dấu ngoặc thông minh.
              // enableSuggestions: true,// Hiển thị gợi ý từ điển khi người dùng nhập văn bản.
              // maxLengthEnforcement: MaxLengthEnforcement.enforced,//Kiểm soát cách thức xử lý khi vượt quá độ dài tối đa.
              // maxLines: 3,// số dòng tối đa cho TextFormField
              // expands: false,//Nếu đặt là true, TextFormField sẽ mở rộng để chiếm tất cả không gian còn lại.
              // maxLength: 10,//Đặt độ dài tối đa cho văn bản trong TextFormField.
              // onChanged: (value) {//Hàm callback này được gọi khi giá trị của TextFormField thay đổi.
              //   print('Value changed: $value');
              // },
              // onTap: () {//Hàm callback này được gọi khi người dùng nhấn vào TextFormField.
              //   print('TextFormField was tapped');
              // },
              // onTapAlwaysCalled: false,// Nếu đặt là true, hàm onTap sẽ luôn được gọi, ngay cả khi TextFormField không thể nhận focus.
              // onTapOutside: (PointerDownEvent event) { //Hàm callback này được gọi khi người dùng nhấn ngoài TextFormField.
              //   print('User tapped outside the TextFormField');
              // },
              // onEditingComplete: () { //Hàm callback này được gọi khi người dùng hoàn thành việc chỉnh sửa văn bản.
              //   print('Editing complete');
              // },
              // onFieldSubmitted: (value) { //Hàm callback này được gọi khi người dùng nhấn nút “Done” trên bàn phím.
              //   print('User submitted: $value');
              // },
              // onSaved: (value) { //Hàm callback này được gọi khi Form chứa TextFormField được lưu.
              //   print('Saved value: $value');
              // },
              // validator: (value) { //Hàm callback này được gọi để xác thực giá trị của TextFormField.
              //   if (value == null || value.isEmpty) {
              //     return 'Please enter some text';
              //   }
              //   return null;
              // },
              // inputFormatters: <TextInputFormatter>[ //Danh sách các định dạng đầu vào cho TextFormField.
              //   FilteringTextInputFormatter.digitsOnly,
              // ],
              // enabled: false,//Nếu đặt là false, TextFormField sẽ không thể tương tác.
              // cursorWidth: 10.0,//Đặt độ rộng của con trỏ.
              // cursorHeight: 20.0,// Đặt chiều cao của con trỏ.
              // cursorRadius: Radius.circular(15.0),// Đặt bán kính cho con trỏ.
              // cursorColor: Colors.blue,//đặt màu con trỏ
              // cursorErrorColor: Colors.red,//Đặt màu cho con trỏ khi có lỗi xảy ra.
              // keyboardAppearance: Brightness.dark,//Đặt chế độ sáng cho bàn phím.
              // scrollPadding: EdgeInsets.all(30.0),//Đặt padding cho cuộn.
              // enableInteractiveSelection: false,//Nếu đặt là false, người dùng sẽ không thể chọn văn bản.
              // selectionControls: MaterialTextSelectionControls(),//Cung cấp các điều khiển để chọn văn bản.
              buildCounter: (BuildContext context, {required int currentLength, required bool isFocused, required int? maxLength}) {
                return Text('$currentLength of $maxLength');
              },//Tạo một widget tùy chỉnh để hiển thị số lượng ký tự hiện tại và tối đa.
              scrollPhysics: BouncingScrollPhysics(),//Đặt vật lý cuộn cho TextFormField.
              autofillHints: [AutofillHints.email],//Cung cấp gợi ý tự động điền cho TextFormField
              autovalidateMode: AutovalidateMode.onUserInteraction,// Đặt chế độ tự động xác thực cho TextFormField.
              scrollController: ScrollController(),// Điều khiển cuộn của TextFormField.
              restorationId: 'myTextFormField',//Đặt ID để khôi phục trạng thái của TextFormField.
              enableIMEPersonalizedLearning: false,//Nếu đặt là false, bàn phím sẽ không học từ người dùng.
              mouseCursor: SystemMouseCursors.text,// Đặt con trỏ chuột cho TextFormField.
              // contextMenuBuilder: (BuildContext context, EditableTextState state) {
              // //Tạo một menu ngữ cảnh tùy chỉnh khi người dùng nhấn và giữ TextFormField.
              //   return <PopupMenuEntry<int>>[
              //     PopupMenuItem<int>(
              //       value: 1,
              //       child: const Text('Cut'),
              //     ),
              //     PopupMenuItem<int>(
              //       value: 2,
              //       child: const Text('Copy'),
              //     ),
              //     PopupMenuItem<int>(
              //       value: 3,
              //       child: const Text('Paste'),
              //     ),
              //   ];
              // },
              // spellCheckConfiguration: SpellCheckConfiguration( //Cấu hình kiểm tra chính tả cho TextFormField.
              //   enabled: true,
              //   onSpellCheckRequested: (EditableTextState state) async {
              //     // Thực hiện kiểm tra chính tả ở đây
              //     return [];
              //   },
              // ),
              // magnifierConfiguration: TextMagnifierConfiguration( // Cấu hình kính lúp cho TextFormField.
              //   enabled: true,
              //   scale: 2.0,
              // ),
              // onAppPrivateCommand: (String command, Map<String, dynamic> arguments) { //Hàm callback này được gọi khi ứng dụng
              //   // nhận được một lệnh riêng từ bàn phím phần cứng hoặc phần mềm.
              //   print('Received command: $command');
              // },
              // cursorOpacityAnimates: true,//Nếu đặt là true, độ trong suốt của con trỏ sẽ thay đổi theo thời gian.
              // // selectionHeightStyle: ui.BoxHeightStyle.max,//Đặt kiểu chiều cao cho vùng chọn.
              // // selectionWidthStyle: ui.BoxWidthStyle.max,//Đặt kiểu chiều rộng cho vùng chọn.
              // dragStartBehavior: DragStartBehavior.start,//Đặt hành vi kéo cho TextFormField.
              // clipBehavior: Clip.antiAlias,//Đặt hành vi cắt cho TextFormField.
              // scribbleEnabled: true,//Nếu đặt là false, người dùng sẽ không thể viết tay vào TextFormField trên iPadOS
              // canRequestFocus: true,//Nếu đặt là false, TextFormField sẽ không thể nhận focus.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập lại';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: (){
                if (_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Thanh cong')
                    ),
                  );
                }
              },
              child: const Text('Kiem Tra'),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nhap ten',
              ),
              onChanged: (value) {
                print('Giá trị của TextField: $value');
              },
            )
          ],
        ),
      ),
    );
  }
}
