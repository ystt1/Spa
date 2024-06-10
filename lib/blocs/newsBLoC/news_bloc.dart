import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbdd/blocs/newsBLoC/news_event.dart';
import 'package:tbdd/blocs/newsBLoC/news_state.dart';
import 'package:tbdd/repositories/NewsRepository.dart';

import '../../Models/News.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository _newsRepository = NewsRepository();

  NewsBloc() : super(NewsInitialState()) {
    on<NewsEventLoad>((event, emit) async {
      List<News> allNews = await getAllNews();
      emit(NewsLoadedState(allNews));
    });
    on<EventFavoriteNews>((event, emit) async {
      if (event.news.Favorite == false) {
        await _newsRepository.createFavoriteNews(event.news);
      } else {
        await _newsRepository.deleteFavoriteNews(event.news);
      }
      List<News> allNews = await getAllNews();
      emit(NewsLoadedState( allNews));
    });
  }

  Future<List<News>> getAllNews() async {
    return await _newsRepository.getAllNews();
  }
}
