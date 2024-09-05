abstract class Endpoints {
  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey = '52384181cde0bdd6f21ec4369dfc9374';
  static const String searchMovie = "search/movie";
  static const String popularMovie = "movie/popular";
  static const String topRatedMovie = "movie/top_rated";
  static const String trendingAllWeekMovie = "trending/all/week";
  static const String upcomingMovie = "movie/upcoming";
}

abstract class ApiKeys {
  static const String apiKey = "api_key";
  static const String page = "page";
  static const String results = "results";
  static const String query = "query";
}
 

//https://api.themoviedb.org/3/search/movie?api_key=52384181cde0bdd6f21ec4369dfc9374