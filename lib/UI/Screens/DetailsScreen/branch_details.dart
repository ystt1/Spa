import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:tbdd/until/function.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Models/Branch.dart';

class BranchDetails extends StatefulWidget {
  final Branch? brancha;

  const BranchDetails({super.key, required this.brancha});

  @override
  State<BranchDetails> createState() => _BranchDetailsState();
}

class _BranchDetailsState extends State<BranchDetails> {
  late Branch branch;
  String fake="09:00-19:00";
  late List<String> listHour=[
    fake,
    fake,
    fake,
    fake,
    fake,
    fake,
    fake
  ];

  Future<void> fetchOpenData() async {
    try {
      QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance.collection('OpeningHour').where("branchID",isEqualTo:widget.brancha?.id ).get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot doc = querySnapshot.docs.first;
        final data = doc.data() as Map<String, dynamic>;
        setState(() {
          listHour = [
            data['monday'] ?? '',
            data['tuesday'] ?? '',
            data['wednesday'] ?? '',
            data['thursday'] ?? '',
            data['friday'] ?? '',
            data['saturday'] ?? '',
            data['sunday'] ?? '',
          ];
        });
      }
    } catch (e) {
      print("Error fetching contact data: $e");
    }
  }
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
    fetchOpenData();
    super.initState();
  }

  Widget RowWidget(String txt1, String txt2,Function function) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 3 / 4,
              child: Text(
                txt1,
                style: TextStyle(color: color.colorWord, fontSize: 15,fontWeight: FontWeight.w500),
                softWrap: true,
              ),
            ),
            GestureDetector(
              onTap:(){ function();},
              child: Container(
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
                    style: TextStyle(color: CupertinoColors.white,fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
      SeparateLine(width: MediaQuery.of(context).size.width)
    ]);
  }

  Widget OtherBranch(Branch branch) {
    return GestureDetector(
      onTap: () {
        context
            .pushReplacementNamed("branchDetails", extra: {"branch": branch});
      },
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: Column(
          children: [
            Expanded(
              child: Image(
                image: NetworkImage(branch.imageUrl),
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

  Widget RowOpenHour(String txt1, String txt2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(txt1,style: TextStyle(color: color.colorWord,fontSize: 15,fontWeight: FontWeight.w500)), Text(txt2,style: TextStyle(color: color.colorWord,fontWeight: FontWeight.w500),)],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.colorPrimary,
        titleSpacing: 0,
        title: Text(
          "Branch Detail",
          style: TextStyle(color: CupertinoColors.white),
        ),
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
            Image(image: NetworkImage(branch.imageUrl),height: 250,width: MediaQuery.of(context).size.width,fit: BoxFit.cover,),
            Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  RowWidget(branch.address, "Bản Đồ",() async {await launchMapsUrl(branch.address);}),
                  RowWidget(branch.phoneNumber, "Gọi Điện",() async {await launchURL(Uri.parse("tel:${branch.phoneNumber}"));}),
                  RowWidget("Giờ mở cửa", "Đặt Lịch",() async {await launchMapsUrl(branch.address);}),
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RowOpenHour("Thứ 2", listHour[0]),
                        RowOpenHour("Thứ 3", listHour[1]),
                        RowOpenHour("Thứ 4", listHour[2]),
                        RowOpenHour("Thứ 5", listHour[3]),
                        RowOpenHour("Thứ 6", listHour[4]),
                        RowOpenHour("Thứ 7", listHour[5]),
                        RowOpenHour("Chủ nhật", listHour[6]),
                      ],
                    ),
                  ),
                  SeparateLine(width: MediaQuery.of(context).size.width),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Các chi nhánh khác",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: color.colorWord),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 120,
                    child: BlocBuilder<BranchesBloc, BranchesState>(
                      builder: (BuildContext context, BranchesState state) {
                        return ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...state.otherList
                                .map((e) => OtherBranch(e))
                                .toList()
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
