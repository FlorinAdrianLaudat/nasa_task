import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entity/news_entity.dart';
import '../repositories/nasa_news_repository.dart';

class GetDailyNasaNews implements UseCase<NewsEntity, NoParams> {
  final NasaNewsRepository repository;

  GetDailyNasaNews({required this.repository});

  @override
  Future<Either<Failure, NewsEntity>> call(NoParams noParams) async {
    return await repository.getDailyNasaNews();
  }
}
