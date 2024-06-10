import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tbdd/Models/Branch.dart';
import 'package:tbdd/UI/Widgets/ButtonWidget.dart';
import 'package:tbdd/blocs/bookingBloC/booking_bloc.dart';
import 'package:tbdd/repositories/BranchRepository.dart';
import 'package:tbdd/until/color.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  DateTime now = DateTime.now();
  Branch? singleSelected;
  String? selectedDay;

  List<Branch> choice = [];
  List<DateTime> time = [];
  List<DateTime> timeStart = [];
  List<DateTime> selectedValueTimeStart = [];

  void initializeTimeStart() {
    timeStart = [
      DateTime(now.year, now.month, now.day, 9, 30),
      DateTime(now.year, now.month, now.day, 10, 0),
      DateTime(now.year, now.month, now.day, 10, 30),
      DateTime(now.year, now.month, now.day, 11, 0),
      DateTime(now.year, now.month, now.day, 11, 30),
      DateTime(now.year, now.month, now.day, 12, 0),
      DateTime(now.year, now.month, now.day, 12, 30),
      DateTime(now.year, now.month, now.day, 13, 0),
      DateTime(now.year, now.month, now.day, 13, 30),
      DateTime(now.year, now.month, now.day, 14, 0),
      DateTime(now.year, now.month, now.day, 14, 30),
      DateTime(now.year, now.month, now.day, 15, 0),
      DateTime(now.year, now.month, now.day, 15, 30),
      DateTime(now.year, now.month, now.day, 16, 0),
      DateTime(now.year, now.month, now.day, 16, 30),
    ];
  }

  @override
  void initState() {
    super.initState();
    initializeTimeStart(); // Initialize time slots
    context.read<BookingBloc>().add(getBranches());
    context.read<BookingBloc>().add(getTimeWeek());
  }

  void setSelectedValueTimeStart(List<DateTime> value) {
    setState(() => selectedValueTimeStart = value);
    print(value);
  }

  void setSingleSelected(Branch? value) {
    setState(() => singleSelected = value);
    print(value?.name);
  }

  void setSelectedDayValue(String? value) {
    setState(() => selectedDay = value);
    print(value);
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: BlocBuilder<BookingBloc, BookingState>(
            builder: (context, state) {
              if (state is BookingSuccess) {
                choice = state.branches;
                return buildBookingContent(context);
              } else if (state is DataTimeSuccess) {
                time = state.times;
                return buildBookingContent(context);
              } else if (state is BookingLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is BookingFailure) {
                return Center(
                  child: Text('Booking failed. Please try again.'),
                );
              } else {
                return Center(
                  child: Text('Unknown state'),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildBookingContent(BuildContext context) {
    return Column(
      children: [
        const TabBar(tabs: [
          Tab(
            text: "Tất cả",
          ),
          Tab(
            text: "Nổi bật",
          ),
        ]),
        Expanded(
          child: TabBarView(
            children: [
              ListView(
                children: [
                  Container(
                    child: Row(children: [
                      Icon(
                        Icons.location_on,
                        size: 15,
                        color: color.colorPrimary,
                      ),
                      Text("Chọn chi nhánh:")
                    ]),
                  ),
                  InlineChoice<Branch>.single(
                    clearable: true,
                    value: singleSelected,
                    onChanged: setSingleSelected,
                    itemCount: choice.length,
                    itemBuilder: (selection, i) {
                      return SizedBox(
                        width: 350,
                        child: ChoiceChip(
                            showCheckmark: false,
                            backgroundColor: color.colorGrey,
                            selectedColor: color.colorPrimary,
                            selected: selection.selected(choice[i]),
                            onSelected: selection.onSelected(choice[i]),
                            label: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 100),
                              child: Column(
                                children: [
                                  FittedBox(child: Text(choice[i].name)),
                                  FittedBox(child: Text(choice[i].address)),
                                ],
                              ),
                            )),
                      );
                    },
                    listBuilder: ChoiceList.createWrapped(
                      alignment: WrapAlignment.center,
                      runSpacing: 10,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        Text("chọn kỹ thuật viên:")
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today),
                        Text("Thời gian đặt lịch:")
                      ],
                    ),
                  ),
                  Choice<String>.inline(
                    clearable: true,
                    value: ChoiceSingle.value(selectedDay),
                    onChanged: ChoiceSingle.onChanged(setSelectedDayValue),
                    itemCount: time.length,
                    itemBuilder: (state, i) {
                      String formattedDate = formatDateTime(time[i]);
                      return ChoiceChip(
                        showCheckmark: false,
                        backgroundColor: color.colorGrey,
                        selectedColor: color.colorPrimary,
                        selected: state.selected(formattedDate),
                        onSelected: state.onSelected(formattedDate),
                        label: Text(formattedDate),
                      );
                    },
                    listBuilder: ChoiceList.createScrollable(
                      spacing: 10,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Icon(Icons.access_time),
                        Text("Chọn khung giờ:")
                      ],
                    ),
                  ),
                  InlineChoice<DateTime>(
                    clearable: true,
                    value: selectedValueTimeStart,
                    onChanged: setSelectedValueTimeStart,
                    itemCount: timeStart.length,
                    itemBuilder: (selection, i) {
                      String formattedTime = formatTime(timeStart[i]);
                      return ChoiceChip(
                        showCheckmark: false,
                        backgroundColor: color.colorGrey,
                        selectedColor: color.colorPrimary,
                        selected: selection.selected(timeStart[i]),
                        onSelected: selection.onSelected(timeStart[i]),
                        label: Text(formattedTime),
                      );
                    },
                    listBuilder: ChoiceList.createWrapped(
                      spacing: 23,
                      runSpacing: 10,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [Icon(Icons.back_hand), Text("Chọn dịch vụ:")],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [Icon(Icons.library_books), Text("Ghi chú:")],
                    ),
                  ),
                  ButtonWidget(text: "Đặt lịch", ontap: () {})
                ],
              ),
              ListView(
                children: [],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
