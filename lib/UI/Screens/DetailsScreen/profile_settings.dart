import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tbdd/until/color.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.colorPrimary,
        title: Text(
          "Chỉnh sửa thông tin",
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10,left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Họ và tên",style: TextStyle(color: Colors.grey,fontSize: 12),),
            TextField(
              maxLines: 1,
            ),
            SizedBox(height: 10,),
            Text("Địa chỉ",style: TextStyle(color: Colors.grey,fontSize: 12)),
            TextField(
              maxLines: 1,
            ),
            SizedBox(height: 10,),
            Text("Ngày sinh",style: TextStyle(color: Colors.grey,fontSize: 12)),
            GestureDetector(
              // Sử dụng GestureDetector để có thể xử lý sự kiện khi người dùng nhấn vào ô nhập liệu
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(), // Ngày mặc định khi mở date picker
                  firstDate: DateTime(1924),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null && pickedDate != selectedDate) {
                  // Nếu người dùng đã chọn một ngày và ngày được chọn khác với ngày trước đó
                  setState(() {
                    selectedDate = pickedDate; // Cập nhật ngày được chọn
                  });
                }
              },
              child: AbsorbPointer(
                // AbsorbPointer để ngăn việc nhập liệu trực tiếp vào TextField
                child: TextField(
                  maxLines: 1,
                  controller: TextEditingController(
                    // Sử dụng TextEditingController để hiển thị giá trị ngày được chọn
                    text: selectedDate != null
                        ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                        : "", // Hiển thị ngày được chọn hoặc rỗng nếu chưa có ngày nào được chọn
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text("Email",style: TextStyle(color: Colors.grey,fontSize: 12)),
            TextField(
              maxLines: 1,
            ),
            SizedBox(height: 10,),
            Text("Zalo",style: TextStyle(color: Colors.grey,fontSize: 12)),
            TextField(
              maxLines: 1,
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              height: 50,
              width: double.infinity,
              child: Card(
                color: color.colorPrimary,
                child: Center(child: Text("Lưu",style: TextStyle(color: CupertinoColors.white,fontSize: 20),)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
