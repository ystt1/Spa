import 'package:choice/choice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tbdd/Models/Branch.dart';
import 'package:tbdd/Models/Employee.dart';
import 'package:tbdd/Models/Order.dart';
import 'package:tbdd/Models/Service.dart';
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
  DateTime? selectedDay;
  Employee? singleSelectedEmployee;
  Service? singleSelectedService;

  List<Branch> choice = [];
  List<DateTime> time = [];
  List<DateTime> timeStart = [];
  List<Service> service = [];
  List<DateTime> selectedValueTimeStart = [];

  List<Employee> employee = [];

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

  void initializeTime() {
    final now = DateTime.now();
    time = [now];

    for (int i = 1; i <= 6; i++) {
      final nextDay = now.add(Duration(days: i));
      time.add(nextDay);
    }
  }

  @override
  void initState() {
    super.initState();
    initializeTimeStart();
    initializeTime();
    context.read<BookingBloc>().add(getBranches());
    context.read<BookingBloc>().add(getEmployee());
    context.read<BookingBloc>().add(getService());
  }

  void setSelectedValueTimeStart(List<DateTime> value) {
    setState(() => selectedValueTimeStart = value);
  }

  void setSingleSelected(Branch? value) {
    setState(() => singleSelected = value);
    print(value?.name);
  }

  void setSelectedDayValue(DateTime? value) {
    setState(() => selectedDay = value);
    print(value);
  }

  void setSelectedSerrviceValue(Service? value) {
    setState(() => singleSelectedService = value);
    print(value);
  }

  String formatDateTime(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  String formatTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  void setSingleSelectedEmployee(Employee? value) {
    setState(() => singleSelectedEmployee = value);
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
                choice = state.branches ?? [];
                return buildBookingContent(context);
              }
              if (state is GetServiceSuccess) {
                service = state.sv;
                return buildBookingContent(context);
              }
              if (state is GetEmployeeSuccess) {
                employee = state.em;
                return buildBookingContent(context);
              }
              if (state is BookingLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is BookingFailure) {
                return Center(
                  child: Text(state.message),
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
                  buildBranchSelection(),
                  buildEmployeeSelection(),
                  buildTimeSelection(),
                  buildTimeStartSelection(),
                  buildServiceSelection(),
                  buildSubmitButton(),
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

  Widget buildBranchSelection() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on,
              size: 15,
              color: color.colorPrimary,
            ),
            Text("Chọn chi nhánh:")
          ],
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
                ),
              ),
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
      ],
    );
  }

  Widget buildEmployeeSelection() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
              color: color.colorPrimary,
            ),
            Text("Chọn kỹ thuật viên:"),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: 250,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: PromptedChoice<Employee>.single(
                title: 'Nhân viên',
                value: singleSelectedEmployee,
                onChanged: setSingleSelectedEmployee,
                itemCount: employee.length,
                itemBuilder: (state, i) {
                  return RadioListTile(
                    value: employee[i],
                    groupValue: state.single,
                    onChanged: (value) {
                      state.select(employee[i]);
                      print(employee[i].name);
                    },
                    title: ChoiceText(
                      employee[i].name,
                      highlight: state.search?.value,
                    ),
                  );
                },
                promptDelegate: ChoicePrompt.delegateBottomSheet(),
                anchorBuilder: ChoiceAnchor.create(inline: true),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTimeSelection() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.calendar_today,
              color: color.colorPrimary,
            ),
            Text("Thời gian đặt lịch:")
          ],
        ),
        Choice<DateTime>.inline(
          clearable: true,
          value: ChoiceSingle.value(selectedDay),
          onChanged: ChoiceSingle.onChanged(setSelectedDayValue),
          itemCount: time.length,
          itemBuilder: (state, i) {
            return ChoiceChip(
              showCheckmark: false,
              backgroundColor: color.colorGrey,
              selectedColor: color.colorPrimary,
              selected: state.selected(time[i]),
              onSelected: state.onSelected(time[i]),
              label: Text("${formatDateTime(time[i])}"),
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
      ],
    );
  }

  Widget buildTimeStartSelection() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.access_time,
              color: color.colorPrimary,
            ),
            Text("Chọn khung giờ:")
          ],
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
      ],
    );
  }

  Widget buildServiceSelection() {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.back_hand,
              color: color.colorPrimary,
            ),
            Text("Chọn dịch vụ:")
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: 250,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: PromptedChoice<Service>.single(
                title: 'Dịch vụ',
                value: singleSelectedService,
                onChanged: setSelectedSerrviceValue,
                itemCount: service.length,
                itemBuilder: (state, i) {
                  return RadioListTile(
                    value: service[i],
                    groupValue: state.single,
                    onChanged: (value) {
                      state.select(service[i]);
                    },
                    title: ChoiceText(
                      service[i].name,
                      highlight: state.search?.value,
                    ),
                  );
                },
                promptDelegate: ChoicePrompt.delegateBottomSheet(),
                anchorBuilder: ChoiceAnchor.create(inline: true),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSubmitButton() {
    return Column(
      children: [
        SizedBox(height: 10),
        ButtonWidget(
          text: "Đặt lịch",
          ontap: () {
            if (singleSelected != null &&
                selectedDay != null &&
                singleSelectedEmployee != null &&
                singleSelectedService != null &&
                selectedValueTimeStart.isNotEmpty) {
              final Order = order(
                timeStart: selectedValueTimeStart.first,
                timeDate: selectedDay!,
                idemployee: singleSelectedEmployee!.id,
                idBranch: singleSelected!.id,
                idservice: singleSelectedService!.id,
              );
              context.read<BookingBloc>().add(Addorder(Order: Order));
            }
          },
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
