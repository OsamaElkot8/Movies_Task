import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/models/bloc/account_blocs/watchlist_bloc/watchlist_bloc.dart';
import 'package:movies_task/models/bloc/account_blocs/watchlist_bloc/watchlist_bloc_event.dart';
import 'package:movies_task/models/utilities/shared_preferences/shared_preferences.dart';
import 'package:movies_task/repository/network/api_response/api_response.dart';
import 'package:movies_task/repository/network/network_constants.dart';
import 'package:movies_task/repository/network/user/watch_list_movies/watch_list_movies_api_client.dart';
import 'package:movies_task/ui/components/buttons/default_round_button.dart';
import 'package:movies_task/ui/ui_helper.dart';

class WatchlistRemoveIconView extends StatelessWidget {
  final int mediaId;
  const WatchlistRemoveIconView({Key? key, required this.mediaId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme _colorScheme = UIHelper.getColorScheme(context);

    return DefaultRoundButton(
        backgroundColor: _colorScheme.error,
        child: Icon(
          Icons.remove_circle,
          color: _colorScheme.background,
        ),
        onPressed: () => _watchListIconOnPressed(context));
  }

  void _watchListIconOnPressed(BuildContext context) async {
    ApiResponse _result = await _removeFromWatchList(context);

    if (_result.statusCode == NetworkConstants.successWishlistRemove) {
      _fetchWatchlist(context);
    }
  }

  Future<ApiResponse> _removeFromWatchList(BuildContext context) async {
    UIHelper.showLoading(context);

    const String _mediaType = "movie";
    const bool _watchlist = false;
    final int _mediaId = mediaId;

    Map<String, dynamic> _addToWatchListBody = {
      NetworkConstants.keyMediaType: _mediaType,
      NetworkConstants.keyMediaId: _mediaId,
      NetworkConstants.keyWatchlist: _watchlist
    };

    final SharedPreferences _localStorage = SharedPreferences.instance;

    final int? _accountId = await _localStorage.getUserLoggedInAccountId();
    final String? _sessionId = await _localStorage.getUserLoggedInSessionId();

    ApiResponse _result = await WatchListMoviesApiClient().addToWatchList(
        accountId: _accountId!,
        apiKey: NetworkConstants.apiKey,
        sessionId: _sessionId!,
        body: _addToWatchListBody);

    UIHelper.hideLoading(context);

    return _result;
  }

  void _fetchWatchlist(BuildContext context) {
    final _watchlistBloc = context.read<WatchlistBloc>();
    // getting logged in user watchlist
    _watchlistBloc.add(WatchlistFetch());
  }
}
