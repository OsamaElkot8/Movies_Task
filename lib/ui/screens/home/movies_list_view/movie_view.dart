import 'package:flutter/material.dart';
import 'package:movies_task/models/entities/movie/movie.dart';
import 'package:movies_task/ui/components/image_views/default_image_placeholder.dart';
import 'package:movies_task/ui/ui_constants.dart';
import 'package:movies_task/ui/ui_helper.dart';

class MovieView extends StatelessWidget {
  final Movie movie;
  const MovieView({Key? key, required this.movie}) : super(key: key);

  final OutlinedBorder _cardShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)));
  final double _cardElevation = 12.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: _cardShape,
      elevation: _cardElevation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _movieImageView(),
          const SizedBox(
            height: 20.0,
          ),
          _movieTitleView(context),
          const SizedBox(
            height: 5.0,
          ),
          _movieOverviewView(context),
        ],
      ),
    );
  }

  Widget _movieImageView() {
    const double _imageWidth = double.infinity;
    const double _imageHeight = 200.0;

    return Image.network(
      movie.posterURL,
      fit: BoxFit.cover,
      errorBuilder: (ctx, exception, stackTrace) =>
          const DefaultImagePlaceHolder(
        width: _imageWidth,
        height: _imageHeight,
      ),
      height: _imageHeight,
      width: _imageWidth,
    );
  }

  Widget _movieTitleView(BuildContext context) {
    TextTheme _textTheme = UIHelper.getTextTheme(context);
    String _title = movie.title ?? UiConstants.stringEmpty;
    const EdgeInsets _textPadding = EdgeInsets.symmetric(horizontal: 10.0);

    return Padding(
      padding: _textPadding,
      child: Text(
        _title,
        style: _textTheme.headline3,
      ),
    );
  }

  Widget _movieOverviewView(BuildContext context) {
    TextTheme _textTheme = UIHelper.getTextTheme(context);
    String _overview = movie.overview ?? UiConstants.stringEmpty;
    const EdgeInsets _textPadding =
        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0);

    return Padding(
      padding: _textPadding,
      child: Text(
        _overview,
        style: _textTheme.bodyText1,
      ),
    );
  }
}
