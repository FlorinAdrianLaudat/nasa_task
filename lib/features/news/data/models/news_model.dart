import '../../domain/entity/news_entity.dart';

class NewsModel extends NewsEntity {
  const NewsModel(
      {required date,
      required explanation,
      required hdurl,
      required mediaType,
      required serviceVersion,
      required title,
      required url})
      : super(
            date: date,
            explanation: explanation,
            hdurl: hdurl,
            mediaType: mediaType,
            serviceVersion: serviceVersion,
            title: title,
            url: url);

  factory NewsModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      throw ArgumentError;
    }
    return NewsModel(
        date: json["date"],
        explanation: json["explanation"],
        hdurl: json["hdurl"],
        mediaType: json["media_type"],
        serviceVersion: json["service_version"],
        title: json["title"],
        url: json["url"]);
  }
}
