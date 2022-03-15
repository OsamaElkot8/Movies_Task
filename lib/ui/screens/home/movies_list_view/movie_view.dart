import 'package:flutter/material.dart';
import 'package:movies_task/main.dart';
import 'package:movies_task/models/entities/movie/movie.dart';
import 'package:movies_task/models/utilities/shared_preferences/shared_preferences.dart';
import 'package:movies_task/repository/network/api_response/api_response.dart';
import 'package:movies_task/repository/network/network_constants.dart';
import 'package:movies_task/repository/network/user/watch_list_movies/watch_list_movies_api_client.dart';
import 'package:movies_task/ui/components/buttons/default_round_button.dart';
import 'package:movies_task/ui/components/image_views/default_image_placeholder.dart';
import 'package:movies_task/ui/ui_constants.dart';
import 'package:movies_task/ui/ui_helper.dart';

class MovieView extends StatelessWidget {
  final Movie movie;
  MovieView({Key? key, required this.movie}) : super(key: key);

  final OutlinedBorder _cardShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)));
  final double _cardElevation = 12.0;

  final Future<String?> _sessionId =
      SharedPreferences.instance.getUserLoggedInSessionId();

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
          _movieImageView(context),
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

  Widget _movieImageView(BuildContext context) {
    const double _imageWidth = double.infinity;
    const double _imageHeight = 200.0;
    const double _positionedWatchListItemTop = 10.0;
    const double _positionedWatchListItemRight = 10.0;

    return Stack(
      children: [
        Image.network(
          movie.posterURL,
          fit: BoxFit.cover,
          errorBuilder: (ctx, exception, stackTrace) =>
              const DefaultImagePlaceHolder(
            width: _imageWidth,
            height: _imageHeight,
          ),
          height: _imageHeight,
          width: _imageWidth,
        ),
        Positioned(
            top: _positionedWatchListItemTop,
            right: _positionedWatchListItemRight,
            child: _watchListIconView(context))
      ],
    );
  }

  Widget _watchListIconView(BuildContext context) {
    final ColorScheme _colorScheme = UIHelper.getColorScheme(context);

    return FutureBuilder<String?>(
      future: _sessionId,
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.data != null) {
          return DefaultRoundButton(
              child: Icon(
                Icons.playlist_add,
                color: _colorScheme.background,
              ),
              onPressed: () =>
                  _wishListIconOnPressed(context, sessionId: snapshot.data!));
        }

        return const SizedBox.shrink();
      },
    );
  }

  void _wishListIconOnPressed(BuildContext context,
      {required String sessionId}) async {
    _showSnackBarMessage(context,
        message: appLocalizations(context).actionInProgress);

    ApiResponse _result = await _addToWatchList(sessionId: sessionId);

    if (_result.statusCode == NetworkConstants.success) {
      _showSnackBarMessage(context,
          message: appLocalizations(context).addedToWatchlist);
    } else {
      _showSnackBarMessage(context,
          message: appLocalizations(context).failedToAdd);
    }
  }

  Future<ApiResponse> _addToWatchList({required String sessionId}) async {
    const String _mediaType = "movie";
    const bool _watchlist = true;
    final int _mediaId = movie.id;

    Map<String, dynamic> _addToWatchListBody = {
      NetworkConstants.keyMediaType: _mediaType,
      NetworkConstants.keyMediaId: _mediaId,
      NetworkConstants.keyWatchlist: _watchlist
    };

    final int? _accountId =
        await SharedPreferences.instance.getUserLoggedInAccountId();

    ApiResponse _result = await WatchListMoviesApiClient().addToWatchList(
        accountId: _accountId!,
        apiKey: NetworkConstants.apiKey,
        sessionId: sessionId,
        body: _addToWatchListBody);

    return _result;
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

  void _showSnackBarMessage(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
