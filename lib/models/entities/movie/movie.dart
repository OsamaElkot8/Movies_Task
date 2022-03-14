import 'package:json_annotation/json_annotation.dart';
import 'package:movies_task/repository/network/network_constants.dart';
import 'package:movies_task/ui/ui_constants.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  late int id;
  String? title, overview;
  @JsonKey(name: NetworkConstants.keyPosterPath)
  String? posterPath;

  Movie({required this.id, this.title, this.overview, this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  String get posterURL {
    if (posterPath == null || posterPath!.isEmpty) {
      return UiConstants.stringEmpty;
    }

    return NetworkConstants.urlMoviePosterUrl + posterPath!;
  }
}
