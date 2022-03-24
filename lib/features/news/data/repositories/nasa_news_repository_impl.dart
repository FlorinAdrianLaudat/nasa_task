import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entity/news_entity.dart';
import '../../domain/repositories/nasa_news_repository.dart';
import '../datasource/nasa_news_data_source.dart';

class NasaNewsRepositoryImpl implements NasaNewsRepository {
  final NasaNewsDatasource dataSource;
  //final Repository repository;

  NasaNewsRepositoryImpl({
    required this.dataSource,
    //required this.repository,
  });

  @override
  Future<Either<Failure, NewsEntity>> getDailyNasaNews() async {
    try {
      final result = await dataSource.getDailyNews();
      return Right(result);
    } on Exception {
      return Left(ServerFailure());
    }
  }
}
