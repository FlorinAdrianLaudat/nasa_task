import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entity/news_entity.dart';

abstract class NasaNewsRepository {
  Future<Either<Failure, NewsEntity>> getDailyNasaNews();
}
