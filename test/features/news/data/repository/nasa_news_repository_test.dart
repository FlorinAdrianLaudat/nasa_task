import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_task/features/news/data/repositories/nasa_news_repository_impl.dart';
import 'package:nasa_task/features/news/domain/repositories/nasa_news_repository.dart';

import '../../../../mocks/mock_classes.dart';
import '../../../../stubs.dart';

main() {
  late MockNasaNewsDatasource dataSource;
  late NasaNewsRepository repository;

  setUp(() {
    dataSource = MockNasaNewsDatasource();
    repository = NasaNewsRepositoryImpl(
      dataSource: dataSource,
    );
  });

  test('should success when there is no exception', () async {
    // act
    final result = await repository.getDailyNasaNews();
    // assert
    expect(result, equals(Right(Stubs.getNewsModel())));
  });
}
