import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tbdd/blocs/newsBLoC/news_event.dart';
import 'package:tbdd/blocs/newsBLoC/news_state.dart';

class NewsBloc extends Bloc<NewsEvent,NewsState> {
  NewsBloc():super(NewsInitialState());
}
