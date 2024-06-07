import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbdd/blocs/HomeScreenBLoC/home_screen_event.dart';
import 'package:tbdd/blocs/HomeScreenBLoC/home_screen_state.dart';

import '../../Models/Branch.dart';
import '../../Models/News.dart';
import '../../Models/Service.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  HomeBloc():super(HomeStateIninitial()){
    on<HomeEventLoad>((event, emit) async {
      emit(HomeLoadingState());
      await Future.delayed(Duration(seconds: 2));
      emit(HomeStateLoad(newsList, highlighServices, branches));
    });
  }
}

List<Service> highlighServices = [
  Service(
    id: '1-1',
    imgUrl:
    'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
    name: 'Basic Haircut',
    duration: '30 mins',
    detail: 'A simple haircut to keep you looking fresh.',
    isHighlight: true,
    price: 15.0,
    categoryId: '1',
  ),
  Service(
    id: '1-2',
    imgUrl:
    'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
    name: 'Advanced Haircut',
    duration: '45 mins',
    detail: 'A more detailed haircut with styling included.',
    isHighlight: false,
    price: 25.0,
    categoryId: '1',
  ),
  Service(
    id: '2-1',
    imgUrl:
    'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
    name: 'Swedish Massage',
    duration: '60 mins',
    detail: 'A relaxing full-body massage.',
    isHighlight: true,
    price: 50.0,
    categoryId: '2',
  ),
];


List<News> newsList = [
  News(
    id: 1,
    imageUrl:
    'https://img.freepik.com/free-photo/3d-rendering-illustration-letter-blocks-forming-word-news-white-background_181624-60840.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais',
    title: 'Featured News 1',
    details: 'Details of featured news 1.',
    postedTime: DateTime.now().subtract(Duration(days: 1)),
    isFeatured: true,
  ),
  News(
    id: 2,
    imageUrl:
    'https://img.freepik.com/free-photo/3d-rendering-illustration-letter-blocks-forming-word-news-white-background_181624-60840.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais',
    title: 'Featured News 2',
    details: 'Details of featured news 2.',
    postedTime: DateTime.now().subtract(Duration(days: 2)),
    isFeatured: true,
  ),
  News(
    id: 3,
    imageUrl:
    'https://img.freepik.com/free-photo/3d-rendering-illustration-letter-blocks-forming-word-news-white-background_181624-60840.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais',
    title: 'Non-featured News 1',
    details: 'Details of non-featured news 1.',
    postedTime: DateTime.now().subtract(Duration(days: 3)),
    isFeatured: false,
  ),

];

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