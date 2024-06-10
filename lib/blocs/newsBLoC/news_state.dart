import '../../Models/News.dart';

abstract class NewsState {
  List<News> listAllNews=[];
  NewsState({required this.listAllNews});
}

class NewsInitialState extends NewsState{
  NewsInitialState():super(listAllNews: []);
}

class NewsLoadingState extends NewsState{
  NewsLoadingState():super(listAllNews: []);
}

class NewsLoadedState extends NewsState{
  NewsLoadedState(List<News> list):super(listAllNews: list);
}



