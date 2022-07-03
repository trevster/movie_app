import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:movie_app/models/FailedRequestModel.dart';
import 'package:movie_app/models/NowPlayingModel.dart';
import 'package:movie_app/network/movie_network.dart';

class MovieRepository {
  Future<ResponseModel> nowPlaying({
    required int page,
  }) async {
    final client = RetryClient(Client());
    Response response;
    dynamic decodedResponse;
    try {
      final url = MovieNetwork.nowPlaying(page);
      response = await client.get(url);
      decodedResponse = MovieNetwork.decodeResponse(response.bodyBytes);
    } finally {
      client.close();
    }
    if(response.statusCode != 200) {
      return ResponseModel<FailedRequestModel>(
        decodedResponse: FailedRequestModel.fromJson(decodedResponse),
        response: response,
      );
    }
    return ResponseModel<NowPlayingModel>(
      decodedResponse: NowPlayingModel.fromJson(decodedResponse),
      response: response,
    );
  }
}
