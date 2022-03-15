import 'package:flutter/material.dart';
import 'package:movies_task/main.dart';
import 'package:movies_task/models/utilities/shared_preferences/shared_preferences.dart';
import 'package:movies_task/repository/network/api_response/api_response.dart';
import 'package:movies_task/repository/network/network_constants.dart';
import 'package:movies_task/repository/network/user/watch_list_movies/watch_list_movies_api_client.dart';
import 'package:movies_task/ui/components/buttons/default_round_button.dart';
import 'package:movies_task/ui/ui_helper.dart';

class WatchlistAddIconView extends StatelessWidget {
  final int mediaId;
  WatchlistAddIconView({Key? key, required this.mediaId}) : super(key: key);

  final Future<String?> _sessionId =
      SharedPreferences.instance.getUserLoggedInSessionId();

  @override
  Widget build(BuildContext context) {
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
              onPressed: () => _watchListIconOnPressed(context,
                  mediaId: mediaId, sessionId: snapshot.data!));
        }

        return const SizedBox.shrink();
      },
    );
  }

  void _watchListIconOnPressed(BuildContext context,
      {required int mediaId, required String sessionId}) async {
    UIHelper.showSnackBarMessage(context,
        message: appLocalizations(context).actionInProgress);

    ApiResponse _result =
        await _addToWatchList(mediaId: mediaId, sessionId: sessionId);

    if (_result.statusCode == NetworkConstants.successWishlistAdd) {
      UIHelper.showSnackBarMessage(context,
          message: appLocalizations(context).addedToWatchlist);
    } else {
      UIHelper.showSnackBarMessage(context,
          message: appLocalizations(context).failedToAdd);
    }
  }

  Future<ApiResponse> _addToWatchList(
      {required int mediaId, required String sessionId}) async {
    const String _mediaType = "movie";
    const bool _watchlist = true;
    final int _mediaId = mediaId;

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
}
