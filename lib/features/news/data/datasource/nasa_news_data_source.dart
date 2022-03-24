import 'dart:io';

import '../../../../core/network/client.dart';
import '../../../../resources/injection_container.dart';
import '../../../../resources/network/network_constants.dart';
import '../models/news_model.dart';

class NasaNewsDatasource {
  final Client client;

  NasaNewsDatasource({required this.client});

  Future<NewsModel> getDailyNews() async {
    NetworkConstants networkConstants = di<NetworkConstants>();
    String url =
        networkConstants.baseURL + '?' + networkConstants.tokenAPIForNews;

    final response = await client.get(url);
    if (response.statusCode == 200) {
      return NewsModel.fromJson(response.data);
    } else {
      throw const HttpException('Wrong answer');
    }
  }
}
