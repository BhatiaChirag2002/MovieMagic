import 'dart:convert';

import 'package:movie_magic/model/movie.dart';
import 'package:movie_magic/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIs {
  // for getting data for trending movie
  static const trendingMovieUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey';
  Future<List<Movie>> getTrendingMovie() async {
    final response = await http.get(Uri.parse(trendingMovieUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }

  // for getting data for popular movies
  static const popularMovieUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';
  Future<List<Movie>> getPopularMovie() async {
    final response = await http.get(Uri.parse(popularMovieUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }

  // for getting data for Top Rated movies
  static const topRatedMovieUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey';
  Future<List<Movie>> getTopRatedMovie() async {
    final response = await http.get(Uri.parse(topRatedMovieUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }

  // for getting data for upcoming movies
  static const upComingMovieUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey';
  Future<List<Movie>> getUpComingMovie() async {
    final response = await http.get(Uri.parse(upComingMovieUrl));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }

  // for getting data for popular movies
  static const popularMovieUrlMulti =
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey';
  Future<List<Movie>> getPopularMovieMulti() async {
    final response = await http.get(Uri.parse(popularMovieUrlMulti));
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Something Happened');
    }
  }
}
