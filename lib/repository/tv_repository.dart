import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:movie_app/models/movie/FailedRequestModel.dart';
import 'package:movie_app/models/tv/TvDetailsWithReviewsModel.dart';
import 'package:movie_app/models/tv/TvOnAirModel.dart';
import 'package:movie_app/network/movie_network.dart';

class TvRepository {

  Future<ResponseModel> getTvOnAir({
    required int page,
  }) async {
    final client = RetryClient(Client());
    Response response;
    dynamic decodedResponse;
    try {
      final url = MovieNetwork.tvOnTheAir(page);
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
    return ResponseModel<TvOnAirModel>(
      decodedResponse: TvOnAirModel.fromJson(decodedResponse),
      response: response,
    );
  }

  Future<ResponseModel> getTvPopular({
    required int page,
  }) async {
    final client = RetryClient(Client());
    Response response;
    dynamic decodedResponse;
    try {
      final url = MovieNetwork.tvPopular(page);
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
    return ResponseModel<TvOnAirModel>(
      decodedResponse: TvOnAirModel.fromJson(decodedResponse),
      response: response,
    );
  }

  Future<ResponseModel> getTvDetailWithReviews({
    required int tvId,
  }) async {
    final client = RetryClient(Client());
    Response response;
    dynamic decodedResponse;
    try {
      final url = MovieNetwork.tvDetailsWithReviews('$tvId');
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
    return ResponseModel<TvDetailsWithReviewsModel>(
      decodedResponse: TvDetailsWithReviewsModel.fromJson(decodedResponse),
      response: response,
    );
  }
}