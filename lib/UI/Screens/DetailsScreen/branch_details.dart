import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/UI/Widgets/separate_line.dart';
import 'package:tbdd/blocs/brachesBLoC/branches_bloc.dart';
import 'package:tbdd/blocs/brachesBLoC/branches_event.dart';
import 'package:tbdd/blocs/brachesBLoC/branches_state.dart';
import 'package:tbdd/until/color.dart';

import '../../../Models/Branch.dart';

class BranchDetails extends StatefulWidget {
  final Branch? brancha;

  const BranchDetails({super.key, required this.brancha});

  @override
  State<BranchDetails> createState() => _BranchDetailsState();
}

class _BranchDetailsState extends State<BranchDetails> {
  late Branch branch;

  @override
  void initState() {
    branch = widget.brancha ??
        Branch(
          id: "9999",
          imageUrl:
              'https://thumbs.dreamstime.com/b/error-rubber-stamp-word-error-inside-illustration-109026446.jpg',
          name: 'Chi nhánh Lỗi',
          address: 'Lỗi',
          openingHours: 'Lỗi',
          phoneNumber: 'Lỗi',
        );
    context
        .read<BranchesBloc>()
        .add(GetOtherBranchesEvent(selectedBranch: branch));
    super.initState();
  }

  Widget RowWidget(String txt1, String txt2) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 3 / 4,
                child: Text(
                  txt1,
                  style: TextStyle(color: color.colorWord, fontSize: 15),
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1 / 5,
                height: 40,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  color: color.colorPrimary,
                  elevation: 1,
                  child: Center(
                      child: Text(
                    txt2,
                    style: TextStyle(color: CupertinoColors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
        SeparateLine(width: MediaQuery.of(context).size.width)
    ]
    );
  }

  Widget OtherBranch(Branch branch) {
    return GestureDetector(
      onTap:() {context.pushReplacementNamed("branchDetails",extra:{ "branch":branch});},
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            Expanded(
              child: Image(
                image: NetworkImage(
                    branch.imageUrl),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  branch.name,
                  style: TextStyle(fontSize: 18, color: color.colorWord),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.colorPrimary,
        titleSpacing: 0,
        title: Text("Branch Detail",style: TextStyle(color: CupertinoColors.white),),
        iconTheme: IconThemeData(color: CupertinoColors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(5),
                alignment: Alignment.topLeft,
                child: Text(
                  branch.name,
                  style: TextStyle(
                      fontSize: 24,
                      color: color.colorWord,
                      fontWeight: FontWeight.bold),
                )),
            Image(image: NetworkImage(branch.imageUrl)),
            Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  RowWidget(branch.address, "Bản Đồ"),
                  RowWidget(branch.phoneNumber, "Gọi Điện"),
                  RowWidget("Giờ mở cửa", "Đặt Lịch"),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Text(
                    "Các chi nhánh khác",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: color.colorWord),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 120,
                    child: BlocBuilder<BranchesBloc, BranchesState>(
                      builder: (BuildContext context, BranchesState state) {

                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                         ...state.otherList.map((e) => OtherBranch(e)).toList()
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
