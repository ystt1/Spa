import '../../Models/News.dart';

abstract class NewsState {
}

class NewsInitialState extends NewsState{

}

class NewsLoadingState extends NewsState{

}

class NewsLoadedState extends NewsState{
  List<News> listAllNews=[];
  List<News> listHighlighNews=[];
  NewsLoadedState({required this.listAllNews,required this.listHighlighNews});
}



