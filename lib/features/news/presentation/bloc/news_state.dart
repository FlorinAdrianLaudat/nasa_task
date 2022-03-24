part of 'news_bloc.dart';

abstract class NewsState {
  const NewsState();
}

class InitialState extends NewsState {}

class LoadingState extends NewsState {}

class ErrorState extends NewsState {}

class NetworkErrorState extends NewsState {}

class DailyNewsLoadedState extends NewsState {
  final NewsEntity? news;

  DailyNewsLoadedState({required this.news});
}
