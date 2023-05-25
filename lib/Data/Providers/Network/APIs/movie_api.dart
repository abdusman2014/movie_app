import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/Data/Providers/Network/APIs/client.dart';
import 'package:movie_app/app/Config/errors.dart';
import 'package:movie_app/app/Config/settings.dart';

class MovieApi {
  Future<Either<Response<Map<String, dynamic>>, FetchError>>
      fetchGenre() async {
    try {
      Response<Map<String, dynamic>> data =
          await dio.get("/genre/movie/list?api_key=${Settings.apiKey}");

      return Left(data);
    } catch (e) {
      return const Right(FetchError.networkError());
    }
  }
}
