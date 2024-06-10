class BookingRepository {
  List<DateTime> getTimeWeek() {
    List<DateTime> timeList = [];

    // Thêm ngày hiện tại vào danh sách
    timeList.add(DateTime.now());

    // Thêm các ngày tiếp theo vào danh sách
    for (int i = 1; i <= 6; i++) {
      // Vì bạn đã thêm sẵn ngày hiện tại, nên chỉ cần thêm 6 ngày nữa
      timeList.add(DateTime.now().add(Duration(days: i)));
    }

    return timeList;
  }
}
