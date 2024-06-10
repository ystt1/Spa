import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  List<Branch> choice = [];

  @override
  void initState() {
    super.initState();
    context.read<BookingBloc>().add(getBranches());
  }

  Branch? singleSelected;

  void setSingleSelected(Branch? value) {
    setState(() => singleSelected = value);
    print(value?.name);
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
                                        onSelected:
                                            selection.onSelected(choice[i]),
                                        label: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 100),
                                          child: Column(
                                            children: [
                                              FittedBox(
                                                  child: Text(choice[i].name)),
                                              FittedBox(
                                                  child:
                                                      Text(choice[i].address)),
                                            ],
                                          ),
                                        )),
                                  );
                                },
                                listBuilder: ChoiceList.createWrapped(
                                  alignment: WrapAlignment.center,
                                  runSpacing: 10,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 5,
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
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.access_time),
                                    Text("Chọn khung giờ:")
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.back_hand),
                                    Text("Chọn dịch vụ:")
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(Icons.library_books),
                                    Text("Ghi chú:")
                                  ],
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
}
