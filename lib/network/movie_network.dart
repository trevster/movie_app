import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';

class MovieNetwork {
  static const apiKeyV3 = 'e5480e808bedbcd1a2a0b737d7e0a5c1';
  static const _defaultLanguage = 'en-US';

  static const https = 'https';
  static const host = 'api.themoviedb.org';
  static const imageHost = 'image.tmdb.org';

  static const _path3 = '3';
  static const _pathMovie = 'movie';
  static const _pathNowPlaying = 'now_playing';

  static Uri _buildPath({required List<String> paths, Map<String, dynamic>? queryParameters}) {
    return Uri(
      scheme: https,
      host: host,
      pathSegments: [...paths],
      queryParameters: queryParameters,
    );
  }

  static Map<String, String> buildHeaders(Map<String, String>? additionalHeaders) {
    final Map<String, String> defaultHeaders = {
      'api_key': apiKeyV3,
      'language': _defaultLanguage,
    };
    return defaultHeaders..addAll(additionalHeaders!);
  }

  static Map<String, dynamic> buildQueryParameters(Map<String, dynamic>? additionalParams) {
    final Map<String, dynamic> defaultParams = {
      'api_key': apiKeyV3,
      'language': _defaultLanguage,
    };
    return defaultParams..addAll(additionalParams!);
  }

  static dynamic decodeResponse(Uint8List? response) {
    return jsonDecode(utf8.decode(response!));
  }

  static Uri nowPlaying(int page) {
    return _buildPath(
      paths: [_path3, _pathMovie, _pathNowPlaying],
      queryParameters: buildQueryParameters({
        'page': '$page',
      }),
    );
  }

  static Uri movieDetailsWithReviews(String movieId,{List<String>? appendToResponse}) {
    return _buildPath(
      paths: [_path3, _pathMovie, movieId],
      queryParameters: buildQueryParameters({
        'append_to_response': ['reviews', ...?appendToResponse].join(','),
      }),
    );
  }
}

class ResponseModel<T> {
  final T? decodedResponse;
  final Response? response;

  ResponseModel({this.decodedResponse, this.response});
}
