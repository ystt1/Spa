import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbdd/blocs/HomeScreenBLoC/home_screen_event.dart';
import 'package:tbdd/blocs/HomeScreenBLoC/home_screen_state.dart';
import 'package:tbdd/repositories/BranchRepository.dart';
import 'package:tbdd/repositories/NewsRepository.dart';
import '../../Models/Branch.dart';
import '../../Models/News.dart';
import '../../Models/Service.dart';
import '../../repositories/ServiceRepository.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  late List<Branch> branches;
  late List<Service> services;
  late List<News> news;
  final BranchRepository _branchRepository;
  final ServiceRepository _serviceRepository;
  final NewsRepository _newsRepository;

  HomeBloc(this._branchRepository, this._serviceRepository, this._newsRepository) : super(HomeStateIninitial()) {
    on<HomeEventLoad>((event, emit) async {

      emit(HomeLoadingState());
      branches = await _branchRepository.getBranches();
      services=await _serviceRepository.getHighlighBranches();
      news=await _newsRepository.getHighlighNews();
      print(news.length);
      emit(HomeStateLoad(news, services, branches));
    });
  }
}

// List<Service> highlighServices = [
//   Service(
//     id: '1-1',
//     imgUrl:
//         'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
//     name: 'Basic Haircut',
//     duration: '30 mins',
//     detail: 'A simple haircut to keep you looking fresh.',
//     isHighlight: true,
//     price: 15.0,
//     categoryId: '1',
//   ),
//   Service(
//     id: '1-2',
//     imgUrl:
//         'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
//     name: 'Advanced Haircut',
//     duration: '45 mins',
//     detail: 'A more detailed haircut with styling included.',
//     isHighlight: false,
//     price: 25.0,
//     categoryId: '1',
//   ),
//   Service(
//     id: '2-1',
//     imgUrl:
//         'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
//     name: 'Swedish Massage',
//     duration: '60 mins',
//     detail: 'A relaxing full-body massage.',
//     isHighlight: true,
//     price: 50.0,
//     categoryId: '2',
//   ),
//   Service(
//     id: '3-1',
//     imgUrl:
//     'https://www.vacabosanlucas.com/wp-content/uploads/2021/12/Health-Spa.jpg',
//     name: 'Swedish Massage',
//     duration: '60 mins',
//     detail: 'A relaxing full-body massage.',
//     isHighlight: true,
//     price: 50.0,
//     categoryId: '2',
//   ),
// ];

// List<News> newsList = [
//   News(
//     id: "1",
//     imageUrl:
//         'https://img.freepik.com/free-photo/3d-rendering-illustration-letter-blocks-forming-word-news-white-background_181624-60840.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais',
//     title: 'Featured News 1',
//     details: 'Details of featured news 1.',
//     postedTime: DateTime.now().subtract(Duration(days: 1)),
//     isFeatured: true,
//   ),
//   News(
//     id: "2",
//     imageUrl:
//         'https://img.freepik.com/free-photo/3d-rendering-illustration-letter-blocks-forming-word-news-white-background_181624-60840.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais',
//     title: 'Featured News 2',
//     details: 'Details of featured news 2.',
//     postedTime: DateTime.now().subtract(Duration(days: 2)),
//     isFeatured: true,
//   ),
//   News(
//     id: "3",
//     imageUrl:
//         'https://img.freepik.com/free-photo/3d-rendering-illustration-letter-blocks-forming-word-news-white-background_181624-60840.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1707696000&semt=ais',
//     title: 'Non-featured News 1',
//     details: 'Details of non-featured news 1.',
//     postedTime: DateTime.now().subtract(Duration(days: 3)),
//     isFeatured: false,
//   ),
// ];
