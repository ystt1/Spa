import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/Models/Branch.dart';
import 'package:tbdd/until/color.dart';

import '../../until/function.dart';

class BranchCard extends StatelessWidget {
  final Branch branch;

  const BranchCard({super.key, required this.branch});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed("branchDetails", extra: {"branch": branch});
      },
      child: Container(
          margin: const EdgeInsets.only(right: 20),
          width: MediaQuery.of(context).size.width * 4 / 5,
          child: Card(
            elevation: 5,
            shadowColor: Colors.black26,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                      child: Stack(children: [
                        Image(
                          image: NetworkImage(branch.imageUrl),
                          width: MediaQuery.of(context).size.width,
                          height: 170,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: color.colorPrimary,
                                borderRadius: BorderRadius.circular(5)),
                            padding: EdgeInsets.only(
                                left: 7, right: 7, top: 1, bottom: 1),
                            child: Text(
                              "Xem bản đồ",
                              style: TextStyle(
                                  fontSize: 12.5,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ])),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    branch.name,
                    style: TextStyle(
                        color: color.colorWord,
                        fontWeight: FontWeight.w400,
                        fontSize: 17),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.add_location_outlined,
                          size: 16, color: Colors.black45),
                      Expanded(
                          child: Text(" ${branch.address}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45)))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_outlined,
                        size: 16,
                        color: Colors.black45,
                      ),
                      Expanded(
                          child: Text(" ${branch.phoneNumber}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45)))
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Giờ mở cửa: ${branch.openingHours}",
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w200,
                              fontStyle: FontStyle.italic)),
                      Text(
                           !isStoreClosed(branch.openingHours)
                              ? 'Đang mở của'
                              : 'Đã đóng cửa',

                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w200,
                              fontStyle: FontStyle.italic))
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
