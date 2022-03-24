import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entity/news_entity.dart';
import '../../domain/usecase/get_daily_nasa_news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetDailyNasaNews getDailyNasaNews;
  final SharedPreferences sharedPreferences;

  NewsBloc({
    required this.getDailyNasaNews,
    required this.sharedPreferences,
  }) : super(InitialState()) {
    on<GetNewsEvent>(_onGetNewsRequest);
  }

  _onGetNewsRequest(NewsEvent event, Emitter<NewsState> emit) async {
    emit(LoadingState());
    final result = await getDailyNasaNews.call(NoParams());
    result.fold((failure) {
      if (failure is NetworkFailure) {
        emit(NetworkErrorState());
      }
      emit(ErrorState());
    }, (news) => emit(DailyNewsLoadedState(news: news)));
  }
}
