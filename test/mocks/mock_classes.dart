import 'package:mockito/mockito.dart';
import 'package:nasa_task/core/network/client.dart';
import 'package:nasa_task/features/news/data/datasource/nasa_news_data_source.dart';
import 'package:nasa_task/features/news/data/models/news_model.dart';

import '../stubs.dart';

class MockSimpleClient extends Mock implements Client {}

class MockNasaNewsDatasource extends Mock implements NasaNewsDatasource {
  @override
  Future<NewsModel> getDailyNews() => Stubs.getFutureNewsModel();
}
