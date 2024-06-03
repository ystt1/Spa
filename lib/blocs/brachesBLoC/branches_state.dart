
import 'dart:developer';

import '../../Models/Branch.dart';

abstract class BranchesState{
  List<Branch> brachList=[];
  BranchesState(this.brachList);

}

List<Branch> branches = [
  Branch(
    id: 1,
    imageUrl: 'https://cosp.com.vn/uploaded/2023/t2/16-2/thiet-ke-spa-duong-sinh-2.jpg',
    name: 'Chi nhánh 1',
    address: 'Địa chỉ chi nhánh 1',
    openingHours: '8:00 AM - 6:00 PM',
    phoneNumber: '0123456789',
  ),
  Branch(
    id: 2,
    imageUrl: 'https://cosp.com.vn/uploaded/2023/t2/16-2/thiet-ke-spa-duong-sinh-2.jpg',
    name: 'Chi nhánh 2',
    address: 'Địa chỉ chi nhánh 2',
    openingHours: '8:00 AM - 6:00 PM',
    phoneNumber: '0123456789',
  ),
  Branch(
    id: 3,
    imageUrl: 'https://cosp.com.vn/uploaded/2023/t2/16-2/thiet-ke-spa-duong-sinh-2.jpg',
    name: 'Chi nhánh 3',
    address: 'Địa chỉ chi nhánh 3',
    openingHours: '8:00 AM - 6:00 PM',
    phoneNumber: '0123456789',
  ),
  Branch(
    id: 4,
    imageUrl: 'https://cosp.com.vn/uploaded/2023/t2/16-2/thiet-ke-spa-duong-sinh-2.jpg',
    name: 'Chi nhánh 4',
    address: 'Địa chỉ chi nhánh 4',
    openingHours: '8:00 AM - 6:00 PM',
    phoneNumber: '0123456789',
  ),
  Branch(
    id: 5,
    imageUrl: 'https://cosp.com.vn/uploaded/2023/t2/16-2/thiet-ke-spa-duong-sinh-2.jpg',
    name: 'Chi nhánh 5',
    address: 'Địa chỉ chi nhánh 5',
    openingHours: '8:00 AM - 6:00 PM',
    phoneNumber: '0123456789',
  ),
  Branch(
    id: 6,
    imageUrl: 'https://cosp.com.vn/uploaded/2023/t2/16-2/thiet-ke-spa-duong-sinh-2.jpg',
    name: 'Chi nhánh 6',
    address: 'Địa chỉ chi nhánh 6',
    openingHours: '8:00 AM - 6:00 PM',
    phoneNumber: '0123456789',
  ),
];

class BranchesInitial extends BranchesState{

  BranchesInitial():super(branches);

}